package com.phs.myapp.stream;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudyMain {

	//stream ù���..
	@GetMapping("stream/study")
	public String streamOne() {
		/*
		 * Stream
		 * java 8 ���� ��� ����
		 * -Ư¡
		 * 	. ���� �ҽ� �����͸� �������� ����
		 * 	. ���� ������ ȣ�� �� �� ó�� ����. ���� ó����� ����...
		 * 	. ����ó�� ���� - > ���� ó����?
		 * 	. �����ϴٺ��� array�� �� ���� ������... array�� ���� �� �� �����ҵ�
		 * - �ֿ� �޼ҵ�
		 * 	. filter : �־��� ���ǿ� �´� ��ҵ鸸 �ɷ���.
		 * 	. map : �� ��Ҹ� �ٸ� ��ҷ� ���� ������
		 * 	. flatMap : �� ��Ҹ� ��Ʈ������ ���� -> ��� ��Ҹ� �ϳ��� ��Ʈ������ ����...
		 * 	. distinct : ��Ʈ������ �ߺ��� ��� ����
		 * 	. sorted : ��Ʈ�� ����
		 * 	. limit : ��Ʈ������ �ִ� ���� ����
		 * 	. skip : ��Ʈ������ ó�� n ���� ��Ҹ� ���ܽ�Ŵ
		 * 	. forEach : �� ��ҿ� ���Ͽ� �־��� ���� ����
		 * 	. collect : ��Ʈ�� ��Ҹ� ����...
		 * */
		
		List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
		//��Ʈ���� ������ ������ �Ҹ�Ǳ� ������ �� ������ ���� �� �ξ�� ��.
		List<Integer> filteredAndMappedNumbers = numbers.stream()	//����Ʈ�� ��Ʈ������ ��ȯ
			    .filter(n -> n % 2 == 0)							//��Ʈ������ ¦���� �ɷ���
			    .map(n -> n * 2)									//�ɷ��� ��Ҹ� 2��� ����
			    .collect(Collectors.toList());						//���ο� ����Ʈ�� ��������.
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

		return "��Ʈ�� flatMap ����Դϴ�. ::: "+resultList.toString();
	}
	

}
