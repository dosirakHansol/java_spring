package com.phs.myapp.stream;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudyMain {

	//stream 첫사용..
	@GetMapping("stream/study")
	public String streamOne() {
		/*
		 * Stream
		 * java 8 부터 사용 가능
		 * -특징
		 * 	. 기존 소스 데이터를 변경하지 않음
		 * 	. 최종 연산이 호출 될 때 처리 수행. 연산 처리비용 절약...
		 * 	. 병렬처리 지원 - > 병렬 처리란?
		 * 	. 업무하다보면 array를 쓸 때가 많은데... array를 가공 할 때 유용할듯
		 * - 주요 메소드
		 * 	. filter : 주어진 조건에 맞는 요소들만 걸러냄.
		 * 	. map : 각 요소를 다른 요소로 매핑 시켜줌
		 * 	. flatMap : 각 요소를 스트림으로 매핑 -> 모든 요소를 하나의 스트림으로 병합...
		 * 	. distinct : 스트림에서 중복된 요소 제거
		 * 	. sorted : 스트림 정렬
		 * 	. limit : 스트림에서 최대 개수 제한
		 * 	. skip : 스트림에서 처음 n 개의 요소를 제외시킴
		 * 	. forEach : 각 요소에 대하여 주어진 동작 수행
		 * 	. collect : 스트림 요소를 수집...
		 * */
		
		List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
		//스트림은 연산이 끝나면 소모되기 때문에 새 변수에 저장 해 두어야 함.
		List<Integer> filteredAndMappedNumbers = numbers.stream()	//리스트를 스트림으로 변환
			    .filter(n -> n % 2 == 0)							//스트림에서 짝수만 걸러냄
			    .map(n -> n * 2)									//걸러낸 요소를 2배로 만듦
			    .collect(Collectors.toList());						//새로운 리스트에 수집해줌.
		System.out.println(filteredAndMappedNumbers);
		
		
		return "stream/study/streamStudy";
	}
	
	@PostMapping("stream/study")
	@ResponseBody
	public String streamTwo() {
		List<List<Integer>> list = Arrays.asList(
		  Arrays.asList(1, 2),
		  Arrays.asList(3, 4),
		  Arrays.asList(5, 6)
		);
		
		List<Integer> resultList = list.stream()
		  .flatMap(Collection::stream)
		  .collect(Collectors.toList());

		return "스트림 flatMap 결과입니다. ::: "+resultList.toString();
	}
	

}
