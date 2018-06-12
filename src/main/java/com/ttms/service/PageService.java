package com.ttms.service;


import javax.servlet.http.HttpServletRequest;




public interface PageService {


    public void showScheduleByPage(HttpServletRequest request, String pageNow);

    public void showEmployeeByPage(HttpServletRequest request, String pageNow);

    public void showTopEmployeeByPage(HttpServletRequest request, String pageNow);

    public void showStudioByPage(HttpServletRequest request, String pageNow);

    public void showPlayByPage(HttpServletRequest request, String pageNow);

    public void showNoticeByPage(HttpServletRequest request, String pageNow);

//    public void saleTicket(HttpServletRequest request,String pageNow);

}
