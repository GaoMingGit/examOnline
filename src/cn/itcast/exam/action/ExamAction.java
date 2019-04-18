package cn.itcast.exam.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.ExamService;
import cn.itcast.exam.service.impl.ExamServiceImpl;
import cn.itcast.exam.utils.MyNumber;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport {

	// 注入ExamService
	private ExamService examService = new ExamServiceImpl();

	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	// 定义科目一或者科目四的练习题目的抽题目方法
	public String keMuLianXi() {
		System.out.println("ExamAction keMuLianXi方法执行");
		String num = ServletActionContext.getRequest().getParameter("lei");
		Integer leiCode = Integer.parseInt(num);
		ArrayList<QuestionBean> list = (ArrayList<QuestionBean>) examService.keMuLianXi(leiCode);
		// 给题目设置有序的题号
		ArrayList<QuestionBean> questionList = MyNumber.toNumber(list);
		// //把数据储存到指栈中
		// ActionContext.getContext().getValueStack().push(questionList);
		ServletActionContext.getRequest().getSession()
				.setAttribute("questionList", questionList);
		// 根据这个值在页面显示具体的科目练习标题
		ServletActionContext.getRequest().getSession().setAttribute("num", num);
		return "toExercise";
	}

	// 考试前的用户信息确认
	public String toExamPageUI() {
		//得到request对象
		HttpServletRequest request = ServletActionContext.getRequest();
		// 查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		//生成随机考生号
		String userNmber = UUID.randomUUID().toString().replace("-", "");
		//拿到考试科目的类别标志
		request.getSession().setAttribute("lei", request.getParameter("lei"));
		
		request.getSession().setAttribute("userNmber", userNmber);
		request.getSession().setAttribute("exitUser", nowLoginUser);
		request.getSession().setAttribute("message", "不好意思，您还没登录账号，没有权限");
		return "toExamPageUI";

	}
	
	// 定义科目一或者科目四的考试方法
	public String keMuExam() {
		System.out.println("ExamAction keMuExam方法执行");
		String num = ServletActionContext.getRequest().getParameter("lei");
		Integer leiCode = Integer.parseInt(num);
		ArrayList<QuestionBean> list = (ArrayList<QuestionBean>) examService.keMuLianXi(leiCode);
		// 给题目设置有序的题号
		ArrayList<QuestionBean> questionList = MyNumber.toNumber(list);
		for (int i = 0; i < questionList.size(); i++) {
			System.out.println("题号:" + questionList.get(i).getQid());
		}

		// //把数据储存到指栈中
		ActionContext.getContext().getValueStack().push(questionList);
		ServletActionContext.getRequest().getSession()
				.setAttribute("questionList", questionList);
		// 根据这个值在页面显示具体的科目考试的标题
		ServletActionContext.getRequest().getSession().setAttribute("num", num);

		return "toExam";
	}

	// 校对答案
	public String checkAnswer() {
		System.out.println("ExamAction checkAnswer方法执行");
		// 得到考试题目的答案
		PastScoreBean pastScoreBean = new PastScoreBean();
		ArrayList<QuestionBean> list = (ArrayList<QuestionBean>) ServletActionContext.getRequest().getSession().getAttribute("questionList");
		// 获取用户的答案
		// (由于本系统设置的每次考试题目的题量是20道题，所以定义循环语句让其执行20次，就可分别拿到用户的答案)
		/* for(int i = 1 ; i <= 20 ; i++){} */
		// 而由于list集合存放的是本次考试的试题内容，他里面包含了试题的答案，就是说有多少道题就有对应有多少个答案,
		// 为了方便后期代码改进维护，采用集合的大小去控制循环次数
		String userAnswer = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		int index = 0;// 定义集合的index
		Double score = (double) 0; // 定义总分变量并初始化为 0 ；
		Double i = Math.ceil(100 / list.size()); // 5分一道
													// 定义每一道题目的分值，总分为100分，将总分除以当前题目总量，变得每一道题目的平均分值
		// 定义一个集合，将用户答错的题号和答案添加到集合中
		Map<Integer, String> wrongMap = new HashMap<Integer, String>();
		for (QuestionBean bean : list) {
			// 循环得到每一道题目的用户答案，并每当拿到一个答案就校验一次答案
			String[] answer = request.getParameterValues(String.valueOf(list
					.get(index).getQid()));
			// 用户的答案不为空，就进行答案校验
			if (answer != null) {
				for (String string : answer) {
					// 将多选题的答案拼接成连续字母的字符串=======变成ABC这样的格式
					userAnswer = userAnswer + string;
				}
				if (userAnswer.equals(bean.getAnswer())) {
					score = score + i;
					System.out.println("用户答对的题号:" + list.get(index).getQid()
							+ "  用户的答案：" + userAnswer);
				} else {
					// 用户答错的题号和答案添加到集合中
					wrongMap.put(list.get(index).getQid(), userAnswer);
				}
			} else {
				// 用户没有作答,就将题号加到集合里面去
				wrongMap.put(list.get(index).getQid(), null);
			}
			userAnswer = "";
			if (index < list.size()) {
				index++;
			}
		}

		// 统计用户答错或者不答题的数量
		int wrongNumber = wrongMap.size();

		// 统计用户答对的数量
		int rightNumber = list.size() - wrongMap.size();

		// 用户答错或者不答的题存起来
		ServletActionContext.getRequest().getSession().setAttribute("wrongMap", wrongMap);
		System.out.println(score + "    " + wrongNumber + "  " + rightNumber);
		// 得到当前考试的用户
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("exitUser");
		pastScoreBean.setWrongtotal(wrongNumber);
		pastScoreBean.setScore(score.intValue());
		pastScoreBean.setRighttotal(rightNumber);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pastScoreBean.setExamtime(sdf.format(new Date()));
		pastScoreBean.setUser(user);
		ServletActionContext.getRequest().getSession()
				.setAttribute("pastScoreBean", pastScoreBean);
		// 开一个线程，存储用户的历史成绩
		examService.addPastScore(pastScoreBean);
		return "toshow";
	}

	// 用户查看错题的方法
	public String lookWrong() {
		System.out.println("ExamAction lookWrong方法执行");
		// 得到用户的错题集合
		// 集合的key代表数据库对应的题目id，value代表的是用户作答的答案
		Map<Integer, String> wrongMap = (Map<Integer, String>) ServletActionContext.getRequest().getSession().getAttribute("wrongMap");
		// 根据id去查找原来的试题
		ArrayList<QuestionBean> wrongList = examService.getWrongList(wrongMap);
		// 定义一个集合存放用户答案
		ArrayList<String> userWrongAnswer = new ArrayList<String>();
		ServletActionContext.getRequest().getSession()
				.setAttribute("wrongList", wrongList);
		return "toHistory";
	}

	// 用户将想要的错题添加到错题集合的方法
	public String addWrong() throws IOException {
		System.out.println("ExamAction addWrong方法执行");
		// 查询当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest()
				.getSession().getAttribute("exitUser");
		// 获取用户选择添加题目的id
		HttpServletRequest request = ServletActionContext.getRequest();
		int qid = Integer.parseInt(request.getParameter("id"));
		int result = examService.addWrong(nowLoginUser, qid);
		if (result == 1) {
			// 结果返回1说明添加成功
			ServletActionContext.getResponse().getWriter().print(1);
		} else {
			// 结果返回不是1说明添加错题不成功
			ServletActionContext.getResponse().getWriter().print(2);
		}
		return NONE;
	}

	// 用户查看错题集合的方法
	public String lookWrongQuestion() {
		System.out.println("ExamAction lookWrongQuestion方法执行");
		// 查询当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest()
				.getSession().getAttribute("exitUser");
		ArrayList<QuestionBean> wrongQuestionBeanList = examService.lookWrongQuestion(nowLoginUser);
		for (QuestionBean questionBean : wrongQuestionBeanList) {
			System.out.println(nowLoginUser.getUsername() + "  的错题集有:"
					+ questionBean.getQid());
		}
		ServletActionContext.getRequest().getSession()
				.setAttribute("wrongQuestionBeanList", wrongQuestionBeanList);
		// 当用户第一次登录注册网站时候没有错题集，此时要告知用户
		ServletActionContext.getRequest().getSession()
				.setAttribute("size", wrongQuestionBeanList.size());
		return "toLookWrongQuestion";
	}
}
