package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	private static final String UPLOAD_DIR = "C:/profile-pictures/";

	@PostMapping("/upload")
	public String uploadProfilePicture(@RequestParam("file") MultipartFile file, HttpSession session, Model model) {
		if (!file.isEmpty()) {
			try {
				// Save the file to the directory
				String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
				File uploadPath = new File(UPLOAD_DIR);
				if (!uploadPath.exists())
					uploadPath.mkdirs();
				file.transferTo(new File(UPLOAD_DIR + fileName));

				// Set the image path in session
				String profilePicturePath = "/profile-pictures/" + fileName;
				session.setAttribute("profilePicture", profilePicturePath);

				model.addAttribute("message", "Profile picture uploaded successfully.");
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("message", "File upload failed.");
			}
		} else {
			model.addAttribute("message", "Please select a file.");
		}
		return "redirect:/dashboard";
	}
}
