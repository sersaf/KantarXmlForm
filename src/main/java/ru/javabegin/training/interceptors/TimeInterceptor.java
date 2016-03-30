package ru.javabegin.training.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TimeInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(TimeInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setAttribute("startTime", System.currentTimeMillis());
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		long startTime = Long.valueOf(request.getAttribute("startTime").toString());

		Thread.sleep(2900);

		int totalTime = (int) ((System.currentTimeMillis() - startTime) / 1000) % 60;

		modelAndView.addObject("totalTime:", totalTime);
		logger.info(handler + ":post handle method, totalTime passed: " + totalTime + "sec");

	}
}