" 문제 조건
" - Task 1: Create a program
"     - 프로그램 생성 ⇒ 프로그램 명 : ZBC400_D23_COMPUTE
"     - TOP-include를 사용하지 않고, 지정된 패키지에 할당
" - Task 2: Define a selection screen with three input parameters
"     - selection screen에 3개의 입력 파라미터를 정의
"         - 정의할 파라미터 : pa_int1(정수형), pa_int2(정수형), pa_op(1문자 크기의 산술 연산자 - +, -, *, /
" - Task 3: Implement the basic calculation types and output the result
"     - elementary  data object 생성 ⇒ gv_result 생성
"     - 입력된 산술 연산자에 따라 결과 계산 ⇒ CASE 문 사용하여 산술 연산자 별 분기 처리
"     - 계산 결과를 WRITE 문을 사용하여 리스트로 출력 ⇒ 결과 텍스트는 번역 가능하게 만듦
" - Task 4: Catch any errors that might occur
"     - IF 문을 사용하여 아래 오류 해결
"         - 잘못된 산술 연산자가 입력되었을 경우 ⇒ 유효하지 않은 연산자를 입력하면 에러 메시지 표시
"         - 0으로 나누려고 할 경우 ⇒ “0으로 나눌 수 없습니다” 라는 메시지 표시
" - Task 5: Activate and test your program
"     - 프로그램을 activate 처리
"     - 프로그램을 테스트 하여 모든 기능이 정상 동작하는지 확인



* 연습문제 실습 - 2025.01.02

PARAMETERS : pa_int1 TYPE i,
             pa_op   TYPE c, " 하나만 쓸때는 : 을 사용안해도 되는데 여러개 받을때는 :을 사용해야함
             pa_int2 TYPE i.

DATA : gv_result TYPE p LENGTH 16 DECIMALS 2. " elementary data objcet 생성

* 사용자가 입력한 사칙연산이 IF문의 조건과 일치하고 두 번째로 받는 인자 값이 0이 아닐 경우 사칙연산 수행
IF ( pa_op = '+' OR
     pa_op = '-' OR
     pa_op = '*' OR
     pa_op = '/' AND pa_int2 <> 0 ). " SQL이랑 비슷함 : <> -> 0이 아닌 경우

* 사칙 연산 수행
  CASE pa_op.
    WHEN '+'.
      gv_result = pa_int1 + pa_int2. " 덧셈 실행
    WHEN '-'.
      gv_result = pa_int1 - pa_int2. " 뺄셈 실행
    WHEN '*'.
      gv_result = pa_int1 * pa_int2. " 곱셈 실행
    WHEN '/'.
      gv_result = pa_int1 / pa_int2. " 나눗셈 실행
  ENDCASE. " CASE문 종료

* 결과 출력
  WRITE: '결과값: ', gv_result.

* 조건문을 통해 사칙 연산 기호가 나눗셈(/) 인데 두 번째로 받는 인자값이 0일 경우 오류 메시지 출력
ELSEIF pa_op = '/' AND pa_int2 = 0.
  WRITE : TEXT-t01. " 심볼로 출력 : 나누는 수는 0이 될 수 없습니다.
ELSE.
  WRITE : TEXT-t02. " 심볼로 출력 : 잘못된 연산기호입니다.
ENDIF. " IF문 종료

* KEYPOINT
* IF문을 통해 처음부터 사칙 연산 기호 중 하나와 0이 아닌 숫자를 두 번째 인자값을 조건문으로 필터링 하여 예외 사항을 최소화 하는 것

* ++ 추가 정리
* 심볼 정의 하는 방법 3가지
* 1: Text Elements로 들어가서 정의하기
* 2: 미리 심볼을 정의 하지 않고 Text-t02 와 같이 임의의 심볼 이름 입력한 후 알림창을 통해 정의하기
* 3: '새번째는 하드코딩으로 생성'(t03) 이렇게 정의하기