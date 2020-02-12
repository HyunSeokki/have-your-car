# 화면설계 정의서



#### **사용자버전** 

| 화면       | 상황             | 상세                                                         |
| ---------- | ---------------- | ------------------------------------------------------------ |
| login.jsp  |                  | 로그인 화면  (ID, Password 입력)                             |
| main.jsp   |                  | 빌릴 수 있는  차량의 정보를 가져와서 지도에 표시 + 마이페이지 버튼<br/>차량 상세  오버레이 (닫기가 가능한 오버레이) + 대여버튼 |
|            | 대여버튼 클릭 시 | DB 대여  데이터 기록 및 대여 확인 표시 페이지로 이동 <br/> {carNo : [car_no], id : [id]} [POST] |
| rent.jsp   |                  | 내가 대여한  차종 + 디지털 카키 표시 + 반납 버튼             |
| trip.jsp   |                  | 이동 경로  표시(경로 데이터 가져옴) + 결제 버튼              |
| mypage.jsp |                  | 대여 리스트<br/>해당 대여리스트  아래에 (모달팝업으로) 이동경로 표시 |

[![](https://mermaid.ink/img/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdHBhcnRpY2lwYW50IOyLnOyekVxuXHRwYXJ0aWNpcGFudCBsb2dpbi5qc3Bcblx0cGFydGljaXBhbnQgbWFpbi5qc3Bcblx0cGFydGljaXBhbnQgcmVudC5qc3Bcblx0cGFydGljaXBhbnQgdHJpcC5qc3Bcblx0cGFydGljaXBhbnQgbXlwYWdlLmpzcFxuXHRcblx07Iuc7J6RIC0tPj4gbG9naW4uanNwIDogW2luZGV4LmRvXVxuXHRcblx0bG9naW4uanNwIC0tPj4gbWFpbi5qc3AgOiDroZzqt7jsnbgg7JqU7LKtPGJyLz5bL2xvZ2luLmRvXVxuXHRsb2dpbi5qc3AgLT4-IGxvZ2luLmpzcCA6IOyLpO2MqOyLnFxuXHRcblx0Tm90ZSBsZWZ0IG9mIGxvZ2luLmpzcCA6IOuhnOq3uOyduCDtm4Qg7IS47IWY7Jyg7KeAXG5cdFxuXHRsb29wIOqwgOuKpeywqOufiSDtmZXsnbhcblx0XHRtYWluLmpzcCAtLT4-IG1haW4uanNwIDogWy9tYWluLmRvP2Nhck5vPXtjYXJfbm99XVxuXHRlbmRcblx0bWFpbi5qc3AgLS0-PiByZW50LmpzcCA6IOuMgOyXrOuyhO2KvCDtgbTrpq08YnIvPlsvcmVudC5kb11cblx0XG5cdHJlbnQuanNwIC0tPj4gdHJpcC5qc3AgOiDrsJjrgqnrsoTtirwg7YG066atPGJyLz5bL3JldHVybi5kbz9jYXJObz17Y2FyX25vfV1cblx0cmVudC5qc3AgLT4-IHJlbnQuanNwIDog7Iuk7Yyo7IucXG5cdHRyaXAuanNwIC0tPj4gbWFpbi5qc3AgOiDshLHqs7Xsi5wg66as64uk7J2066CJ7Yq4PGJyLz5bL3BheS5kb11cblx0XG5cdG1haW4uanNwIC0tPj4gbXlwYWdlLmpzcCA6IOuniOydtO2OmOydtOyngCDtgbTrpq08YnIvPltteXBhZ2UuZG9dXG5cdGxvb3Ag64yA7JesIOyDgeyEuCDtkZzsi5xcblx0XHRteXBhZ2UuanNwIC0tPj4gbXlwYWdlLmpzcCA6IFtteXBhZ2UuZG8_cmVudE5vPXJlbnRfbm9dXG5cdGVuZCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In19)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdHBhcnRpY2lwYW50IOyLnOyekVxuXHRwYXJ0aWNpcGFudCBsb2dpbi5qc3Bcblx0cGFydGljaXBhbnQgbWFpbi5qc3Bcblx0cGFydGljaXBhbnQgcmVudC5qc3Bcblx0cGFydGljaXBhbnQgdHJpcC5qc3Bcblx0cGFydGljaXBhbnQgbXlwYWdlLmpzcFxuXHRcblx07Iuc7J6RIC0tPj4gbG9naW4uanNwIDogW2luZGV4LmRvXVxuXHRcblx0bG9naW4uanNwIC0tPj4gbWFpbi5qc3AgOiDroZzqt7jsnbgg7JqU7LKtPGJyLz5bL2xvZ2luLmRvXVxuXHRsb2dpbi5qc3AgLT4-IGxvZ2luLmpzcCA6IOyLpO2MqOyLnFxuXHRcblx0Tm90ZSBsZWZ0IG9mIGxvZ2luLmpzcCA6IOuhnOq3uOyduCDtm4Qg7IS47IWY7Jyg7KeAXG5cdFxuXHRsb29wIOqwgOuKpeywqOufiSDtmZXsnbhcblx0XHRtYWluLmpzcCAtLT4-IG1haW4uanNwIDogWy9tYWluLmRvP2Nhck5vPXtjYXJfbm99XVxuXHRlbmRcblx0bWFpbi5qc3AgLS0-PiByZW50LmpzcCA6IOuMgOyXrOuyhO2KvCDtgbTrpq08YnIvPlsvcmVudC5kb11cblx0XG5cdHJlbnQuanNwIC0tPj4gdHJpcC5qc3AgOiDrsJjrgqnrsoTtirwg7YG066atPGJyLz5bL3JldHVybi5kbz9jYXJObz17Y2FyX25vfV1cblx0cmVudC5qc3AgLT4-IHJlbnQuanNwIDog7Iuk7Yyo7IucXG5cdHRyaXAuanNwIC0tPj4gbWFpbi5qc3AgOiDshLHqs7Xsi5wg66as64uk7J2066CJ7Yq4PGJyLz5bL3BheS5kb11cblx0XG5cdG1haW4uanNwIC0tPj4gbXlwYWdlLmpzcCA6IOuniOydtO2OmOydtOyngCDtgbTrpq08YnIvPltteXBhZ2UuZG9dXG5cdGxvb3Ag64yA7JesIOyDgeyEuCDtkZzsi5xcblx0XHRteXBhZ2UuanNwIC0tPj4gbXlwYWdlLmpzcCA6IFtteXBhZ2UuZG8_cmVudE5vPXJlbnRfbm9dXG5cdGVuZCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In19)





#### 자동차버전 (/have/car)

| 화면        | 상황          | 상세                                                         |
| :---------- | ------------- | ------------------------------------------------------------ |
| carTest.jsp |               | 차량 선택  리스트 + 시동 버튼(시동 상태에 따른 색 변화)      |
|             | 차량 선택     | /selectCar.do?carNo={car_no} [GET]<br/>해당 차량 시동 여부를 가져옴. |
|             | 시동 업데이트 | /updateActiveState.do?carNo={car_no} [GET]                   |

[![](https://mermaid.ink/img/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdHBhcnRpY2lwYW50IOyLnOyekVxuXHRwYXJ0aWNpcGFudCBjYXJUZXN0LmpzcFxuXHRwYXJ0aWNpcGFudCBzZXJ2ZXJcblx0XG5cdOyLnOyekSAtLT4-IGNhclRlc3QuanNwIDogL21haW4uZG9cblx0bG9vcCDssKjrn4kg7ISg7YOdXG5cdFx0Y2FyVGVzdC5qc3AtLT4-c2VydmVyICA6IC9zZWxlY3RDYXIuZG8_Y2FyTm89e2Nhcl9ub31cblx0XHRzZXJ2ZXItPj5jYXJUZXN0LmpzcCA6IOywqOufiSDsi5zrj5kg7Jes67aAXG5cdGVuZFxuXHRcblx0bG9vcCDsi5zrj5kg67KE7Yq8IO2BtOumrVxuXHRcdGNhclRlc3QuanNwLS0-PnNlcnZlciA6ICAvdXBkYXRlQWN0aXZlU3RhdGUuZG8_Y2FyTm89e2Nhcl9ub31cblx0XHRzZXJ2ZXIgLT4-IGNhclRlc3QuanNwIDog7Iuc64-Z7KCV67O0IOyXheuNsOydtO2KuFxuXHRlbmQiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG5cdHBhcnRpY2lwYW50IOyLnOyekVxuXHRwYXJ0aWNpcGFudCBjYXJUZXN0LmpzcFxuXHRwYXJ0aWNpcGFudCBzZXJ2ZXJcblx0XG5cdOyLnOyekSAtLT4-IGNhclRlc3QuanNwIDogL21haW4uZG9cblx0bG9vcCDssKjrn4kg7ISg7YOdXG5cdFx0Y2FyVGVzdC5qc3AtLT4-c2VydmVyICA6IC9zZWxlY3RDYXIuZG8_Y2FyTm89e2Nhcl9ub31cblx0XHRzZXJ2ZXItPj5jYXJUZXN0LmpzcCA6IOywqOufiSDsi5zrj5kg7Jes67aAXG5cdGVuZFxuXHRcblx0bG9vcCDsi5zrj5kg67KE7Yq8IO2BtOumrVxuXHRcdGNhclRlc3QuanNwLS0-PnNlcnZlciA6ICAvdXBkYXRlQWN0aXZlU3RhdGUuZG8_Y2FyTm89e2Nhcl9ub31cblx0XHRzZXJ2ZXIgLT4-IGNhclRlc3QuanNwIDog7Iuc64-Z7KCV67O0IOyXheuNsOydtO2KuFxuXHRlbmQiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)



