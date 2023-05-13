package com.phs.myapp.stream;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyMain {

	//stream Ã¹»ç¿ë..
	@GetMapping("stream/study")
	public String streamOne() {
		List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
		List<Integer> filteredAndMappedNumbers = numbers.stream()
			    .filter(n -> n % 2 == 0)
			    .map(n -> n * 2)
			    .collect(Collectors.toList());
		System.out.println(filteredAndMappedNumbers);
		
		return "stream/study/streamStudy";
	}

}
