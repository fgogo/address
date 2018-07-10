package com.aide.zxdk.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
 
public class SetCharacterEncodingFilter extends HttpServlet implements Filter {
 
 protected String encoding = null;
 protected FilterConfig filterConfig = null;
 protected boolean ignore = true;
 
 //Handle the passed-in FilterConfig
 public void init(FilterConfig filterConfig) throws ServletException {
 
   this.filterConfig = filterConfig;
  this.encoding = filterConfig.getInitParameter("encoding");
   String value = filterConfig.getInitParameter("ignore");
   if (value == null) {
     this.ignore = true;
   }
   else if (value.equalsIgnoreCase("true")) {
     this.ignore = true;
   }
   else if (value.equalsIgnoreCase("yes")) {
     this.ignore = true;
   }
   else {
     this.ignore = false;
   }
 
 }
 
 //Process the request/response pair
 
 public void doFilter(ServletRequest request, ServletResponse response,
                     FilterChain chain) throws IOException, ServletException {
 
 // Conditionally select and set the character encoding to be used
 if (ignore || (request.getCharacterEncoding() == null)) {
    String encoding = selectEncoding(request);
    if (encoding != null) {
     request.setCharacterEncoding(encoding);
    }
 }
 
 // Pass control on to the next filter
 chain.doFilter(request, response);
 
}
 
protected String selectEncoding(ServletRequest request) {
 return (this.encoding);
}
 
 //Clean up resources
 public void destroy() {
    this.encoding = null;
    this.filterConfig = null;
 }
}