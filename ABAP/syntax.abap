* General ABAP Syntax

* individual statement로 구성(한 줄씩 단위로 수행)
* 각 statement는 마침표(.)로 끝남
* 문장의 첫 단어는 keyword로 시작
* keyword란? : 특정한 기능이나 명령을 나타내는 예약된 단어나 구문
* keyword는 대소문자를 구분하지 않음

* ex) SELECT, IF, ELSE, CASE, DO, LOOP
* [문법적으로 특별한 의미를 갖고 있으며, 프로그램의 흐름을 제어 / 데이터 처리 등 기능 수행]


* ABAP 프로그램의 구조
* Local data 타입 선언
TYPES tv_char10 TYPE c LENGTH 10. " char 타입의 10자리 선언
TYPES tv_int TYPE i. " 정수 타입 선언
TYPES tv_percentage TYPE p LENGTH 3 DECIMALS 2. " packed number 타입 선언

* 입력 파라미터 변수 선언(Selection Screen 생성)
* PARAMETERS 변수 이름의 자리수가 8자리 이상이면 오류뜸
PARAMETERS pa_dept TYPE tv_char10. " tv_char10을 타입으로 하는 부서명 선언
PARAMETERS pa_name TYPE tv_char10. " tv_char10을 타입으로 하는 이름 선언

* Elementary Data Object 선언
DATA : gv_deptnm TYPE tv_char10. " 부서명
DATA : gv_name TYPE tv_char10. " 이름
DATA : gv_age TYPE tv_int VALUE 26. " 나이 -> int형으로 하면 공백이 나온 뒤 26이 나오지만 그냥 26을 출력하기 위해서는 n을 쓰는게 좋아보임
DATA : gv_date TYPE d. " 날짜 => 20250102로 출력
* DATA : gv_date TYPE sy-datum. " 날짜 => 2025-01-02로 출력 (시스템 날짜라는 의미를 포함하고 있음) - 보통은 이걸 이용해서 출력한다고 함
* DATA : gv_date2 LIKE sy-datum. " 날짜 => 0000-00-00으로 출력 (LIKE 자체가 틀만 복제하는 느낌이라 값은 복제가 안됨)

* 값 할당하여 화면에 출력하기
MOVE pa_dept TO gv_deptnm. " pa_dept 값을 gv_deptnm에 넣기
MOVE pa_name TO gv_name. " pa_name 값을 gv_name에 넣기
* 값 넣기 활용 법
* MOVE sy-datum TO gv_date. " 첫 번째 방법: MOVE를 이용해서 값 넣기
gv_date = sy-datum. " 두 번째 방법: gv_date에 등호를 이용하여 sy-datum 값 넣기
* gv_age = 20. 를 사용하여 VALUE를 사용하지 않고도 gv_age에 20이라는 값을 삽입 할 수 있음

* 출력
WRITE : gv_deptnm, / gv_name, / gv_date.
*WRITE : (2)gv_age. " (2)를 앞에서 사용하는 경우 개행문자 뒤에 쓰면 오류 발생 - 근데 안되는거 같음