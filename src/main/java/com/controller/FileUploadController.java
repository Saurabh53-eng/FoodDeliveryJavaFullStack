package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
public class FileUploadController {

	@PostMapping("/upload")
	public String uploadFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
			return "view";
		}

		try {
			// Save the file to a specific directory
			String uploadDir = "C:/profile-pictures/";
			File destinationFile = new File(uploadDir + file.getOriginalFilename());
			file.transferTo(destinationFile);

			redirectAttributes.addFlashAttribute("message",
					"You successfully uploaded '" + file.getOriginalFilename() + "'!");
		} catch (IOException e) {
			redirectAttributes.addFlashAttribute("message", "Failed to upload file!");
			e.printStackTrace();
		}

		return "view";
	}
}
