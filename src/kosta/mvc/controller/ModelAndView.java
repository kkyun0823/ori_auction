package kosta.mvc.controller;

/**
 * ������ controller�� ����ü�� ����� �� �̵��ؾ��� ���� ������ �̵������ ������ �� ��ü
 * */
public class ModelAndView {
	private String viewName;//�̵��� �� ����
	private boolean isRedirect;//�̵����(false�̸� forward���, true�̸� redirect���)
	
	public ModelAndView() {}

	public ModelAndView(String viewName, boolean isRedirect) {
		super();
		this.viewName = viewName;
		this.isRedirect = isRedirect;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}