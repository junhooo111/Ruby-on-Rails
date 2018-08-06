$rooms = {101 => '예약가능', 102 => '예약가능', 103 => '예약가능', 104 => '예약가능', 105 => '예약가능'}

def input_number                                                                # 메뉴 선택 시 필요한 번호를 입력받는 method
    puts("방 예약 시스템입니다. 원하시는 메뉴를 선택하세요.")
    print("1:예약하기, 2:예약확인, 3:예약취소, 4:종료 ")
    numb = gets.to_i
    return numb                                                                 # 입력 받은 값을 return 해줘 main method에서 if 문을 찾아 들어가게 해준다.
end

def make_reservation                                                            # 1:예약하기 method
    puts("방 번호를 입력하세요.")
    usr_room = gets.to_i                                                        # 방 번호를 입력받습니다.
    $rooms[usr_room] = '예약됨'                                                 # 전역 변수 hash에 저장해 뒀던 방 번호의 key를 가지고 '예약됨' 으로 value를 변경해줍니다. 덮어씌우기..?
    puts ""
    return 0
end

def view_reservation                                                            # 2:예약확인 method
    puts("방 번호를 입력하세요.")
    usr_room = gets.to_i                                                        # 방 번호를 입력받습니다.
    puts "\n방 번호: "
    puts usr_room                                                               # 방 번호 출력
    puts "\n예약확인: "
    puts $rooms[usr_room]                                                       # 해당 방 번호(key) 값에 해당되는 예약 상태(value) 를 출력
    puts ""
    return 0
end

def cancel_reservation                                                          # 3:예약취소 method
    puts("방 번호를 입력하세요.")
    usr_room = gets.to_i                                                        # 방 번호를 입력받습니다.
    $rooms[usr_room] = '예약가능'                                               # 전역 변수 hash에 저장해 뒀던 방 번호의 key를 가지고 '예약가능' 으로 value를 변경해줍니다. 덮어씌우기..?
    puts ""
    print usr_room
    puts "호의 예약이 취소되었습니다. "                                         # 해당 방의 취소를 다시 확인시켜줍니다.
    puts ""
    return 0
end

def main                                                                        # main method
    puts "\n현재 방은 101호, 102호, 103호, 104호, 105호 가 있습니다.
    이 점 참고해서 예약하시기 바랍니다. \n\n"
    while true                                                                  # 항상 true 를 돌게 하여 무한 루프를 만듭니다.
        choose = input_number()                                                 # input_number method에서 return 받아 온 값을 choose라는 변수에 넣어줍니다.
        
        if choose == 1                                                          # choose가 1일 경우 예약하기 method로..
            make_reservation()
        end
        if choose == 2                                                          # choose가 2일 경우 예약확인 method로..
            view_reservation()
        end
        if choose == 3                                                          # choose가 3일 경우 예약취소 method로..
            cancel_reservation()
        end
        if choose == 4                                                          # choose가 4일 경우 무한 루프를 돌 던 while문에 break를 걸어 주어 반복문을 빠져나오게 해줍니다.
            break
        end
    end
    puts "\n방 예약 시스템 종료"
end

main()