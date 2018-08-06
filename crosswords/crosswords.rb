totalwords = gets.chomp.to_s                                                    #totalwords라는 변수에 띄어쓰기를 포함한 두 단어를 입력받습니다.

for i in 0..totalwords.length                                                   #for문을 통해 totalwords안의 띄어쓰기를 찾습니다.
    if totalwords[i] == " "                                                     #띄어쓰기 발견
        for k in 0..i-1
            firstwords = firstwords.to_s + totalwords[k].to_s                   #띄어쓰기 기준으로 왼쪽(그 이전의 글자들)을 firstwords에 저장.
        end
        for j in i+1..totalwords.length
            secondwords = secondwords.to_s + totalwords[j].to_s                 #띄어쓰기 기준으로 오른쪽(그 이후의 글자들)을 secondwords에 저장.
        end
    end
end

N = firstwords.length                                                           #firstwords의 길이를 N에 저장.
M = secondwords.length                                                          #secondwords의 길이를 M에 저장.
firstwords_com=[]
secondwords_com=[]
for i in 0..firstwords.length                                                   #firstwords와 secondwords 사이에 서로 겹치는 글자를 찾는데.. 그 찾은 것들의 위치값? 을 더해서 문자열을 만들어줍니다.
    for j in 0..secondwords.length
        if firstwords[i] == secondwords[j]
            firstwords_com.push(i)
            secondwords_com.push(j)
            # puts firstwords[i],secondwords[j],i,j
        end
    end
end
what_first = firstwords_com[0].to_i                                             #위치 값을 더한 문자열에서 첫 번째 값을 얻어오면 그게 두 단어가 처음으로 만난 위치가 됩니다.
what_second = secondwords_com[0].to_i                                           #마찬가지
# puts firstwords_com[0],secondwords_com

if what_first == 0 && what_second == 0                                          #두 단어의 시작하는 글자부터 똑같은 경우는 따로 if문으로 판독.
   puts firstwords 
   for i in 0..M-2                                                              #각각 세로줄과 가로줄에 단어를 나타내주고 나머지는 "."을 찍어준다.
        for j in 0..N-2                                              
                if j == what_first                                
                    print secondwords[i+1]
                end
                print "."
        end
        puts ""
   end
else                                                                            #나머지의 경우
    for garo_dots in 0..M-1                                                     #firstwords를 기준으로 세로줄을 찍는 for문
        if garo_dots == what_second                                             #각 가로줄에서 secondwords를 기준으로 가로줄을 찍는 for문
            for i in 0..N                                                       #찍고 있던 가로줄과 아까 구한 what_second가 같다면 그 자리에는 "."들 말고 해당하는 문자열(firstwords)를 넣어줍니다.
                print firstwords[i]
            end
        else
            for sero_dots in 0..N-1                                             #"."을 찍는 for문
                if sero_dots == what_first                                    #"."을 찍다가 아까 구한 겹치는 부분을 발견하면 secondwords의 그 자리에 맞는 문자를 넣어줍니다.
                    print secondwords[garo_dots]
                    next
                end
                print "."
            end
        end
        puts ""                                                                 #가로줄 한 줄 다 찍으면 puts로 줄을 바꿔줍니다.
    end
end