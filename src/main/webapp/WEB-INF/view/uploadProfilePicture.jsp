<%@page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%
String uploadPath = application.getRealPath("/");
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) {
	uploadDir.mkdir();
}

try {
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);

	List<FileItem> formItems = upload.parseRequest(request);
	if (formItems != null && formItems.size() > 0) {
		for (FileItem item : formItems) {
	if (!item.isFormField()) {
		String fileName = new File(item.getName()).getName();
		String filePath = uploadPath + fileName;
		File storeFile = new File(filePath);
		item.write(storeFile);

		// Set the file path in the session
		session.setAttribute("profilePicture", "resources/profilePictures/" + fileName);
	}
		}
	}
	response.sendRedirect("dashboard.jsp");
} catch (Exception ex) {
	ex.printStackTrace();
}
%>
