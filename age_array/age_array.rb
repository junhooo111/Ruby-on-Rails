age = []                                                                     # 배열 선언
who = []

puts "나이 순으로 정렬 하고자 하는 사람이 몇 명인가요?"                      # 정렬하고자 하는 사람 수를 입력 받는다.
what_num = gets.chomp.to_i
puts ""

print "정렬 하고 싶은 분들의 성함, 나이 순으로 "                             # ex) 최준호 <엔터> 24 <엔터>
print what_num
puts "개를 입력해주세요!"

for num in 0..what_num-1                                                     # for 문을 통해 배열의 앞에 자리 부터 차례대로 이름,숫자를 받는다.
    print num+1
    puts "번 째 사람이름"
    who[num] = gets.chomp.to_s
    print num+1
    puts "번 째 사람의 나이"
    age[num] = gets.chomp.to_i
end
puts ""                                                                  

puts "오름차순이면 up 내림차순이면 down을 입력해 주세요!"                    # up_down에 up 또는 down 이라는 문자열을 입력받아 저장해준다.
up_down = gets.chomp.to_s
puts ""

# 오름차순 정렬
if up_down == 'up'                                                           # up을 입력받았다면 오름차순을 출력
    puts "입력 받은 나이들을 기준으로 오름차순으로 정렬합니다! :)"
    min = 0                                                                  # i를 이용한 for문을 통해 배열의 첫째 자리 부터 마지막 자리까지 반복을 시켜 차례대로 최솟값을 넣는다.
    for i in 0..what_num-1
        for j in (i+1)..what_num-1                                           # j를 이용한 for문을 통해 각 age[i]에 들어 갈 최솟값을 검사한다.
            if age[j] < age[i]                                               # 자신의 바로 다음 자리 숫자를 확인해서 자신보다 작으면 자리 교환 , 해당사항 없을 시 if문을 건너뛰자.
                min = age[j]
                age[j] = age[i]
                age[i] = min
                temp = who[j]                                                # 그 나이에 해당하는 사람도 동일하게 자리를 바꿔주자.
                who[j] = who[i]
                who[i] = temp
            end
        end
    end
    for k in 0..what_num-1                                                   # 출력은 보기좋게.. 한 명씩 차례대로 보여주자.
        print who[k]
        print ": "
        print age[k]
        puts "살"
    end

# 내림차순 정렬
elsif up_down == 'down'                                                      # down을 입력받았다면 내림차순을 출력
    puts "입력 받은 나이들을 기준으로 내림차순으로 정렬합니다! :)"
    max = 0                                                                  # i를 이용한 for문을 통해 배열의 첫째 자리 부터 마지막 자리까지 반복을 시켜 차례대로 최댓값을 넣는다.
    for i in 0..what_num-1
        for j in (i+1)..what_num-1                                           # j를 이용한 for문을 통해 각 age[i]에 들어 갈 최댓값을 검사한다.
            if age[j] > age[i]                                               # 자신의 바로 다음 자리 숫자를 확인해서 자신보다 크면 자리 교환 , 해당사항 없을 시 if문을 건너뛰자.
                max = age[j]
                age[j] = age[i]
                age[i] = max
                temp = who[j]                                                # 그 나이에 해당하는 사람도 동일하게 자리를 바꿔주자.
                who[j] = who[i]
                who[i] = temp
            end
        end
    end
    for k in 0..what_num-1                                                   # 출력은 보기좋게.. 한 명씩 차례대로 보여주자.
        print who[k]
        print ": "
        print age[k]
        puts "살"
    end
    
else                                                                         # up, down이 아닌 다른 걸 입력받을 시 새로 시작하게 한다.
    puts "오름차순은 up으로 내림차순은 down으로 제대로 입력해 주세요. :("
end