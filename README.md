# we HAvE a car :car: !!!

####  모빌리티 시스템을 위한 👬WeCar👭의 간단한 카쉐어링 플랫폼

<br/>

### Why  HAVE ?

> 디지털키와 간편결제 시스템 등 많은 모빌리티, CCS 시스템을 활용하여 <br/>많은 사용자들이 직접 차를 사지 않아도 차를 가진 것처럼 `HAVE` 편리하게 이용할 수 있는 <br/>카쉐어링 플랫폼을 목적으로 구성한 프로젝트 입니다. 
>
> [@heyheygo99](https://github.com/heyheygo99) [@HyunSeokki](https://github.com/HyunSeokki) [@ahlim721](https://github.com/ahlim721) [@shyeonj](https://github.com/shyeonj)

<br/>

### Ⅰ. 프로젝트의 구성

총 4주의 기간동안 기획, 개발을 효율적으로 하기 위하여 3개의 프로젝트 구간을 나누어서 진행하고 있습니다.

1. ##### 1주차 (2020.02.05 ~ 2020.02.10)

   * 프로젝트 기획, URL 명세서, DB 설계 및 DB 구축, 서버 환경 구축

2. ##### 2주차 (2020.02.10 ~ 2020.02.14)  

   * 분담 기능 구현

3. ##### 3주차 (2020.02.17 ~ 2020.02.21)  `진행중`

   * 분담 기능 구현 및 테스트, 유지보수

4. ##### 4주차 (2020.02.24 ~ 2020.02.28)

   * 테스트 및 유지보수, 발표 준비

<br/>

### Ⅱ. 프로젝트 기술 사양

|            | 이름            | 버전     | 기타       |
| ---------- | --------------- | -------- | ---------- |
| WAS/서버   | Apache / Tomcat |          |            |
| DB         | ORACLE          | 12.2.0.1 | ojdbc8     |
| 백엔드     | Java            | 8        | jdk1.8     |
| 프론트엔드 | JSP             |          |            |
| 프레임워크 | Spring          |          | ABLE_Frame |
| Open API   | Kakao Map API   |          |            |
| 통신       | HTTP / REST api |          |            |

<br/>

### Ⅲ. 시퀀스 다이어그램

[![](https://mermaid.ink/img/eyJjb2RlIjoic3RhdGVEaWFncmFtXG5cblsqXSAtLT4g7Iuc64-Zb24gIyDssKjrn4lcbuyLnOuPmW9uIC0tPiDstIjri7nsnITsuZjsoIDsnqUgIyDssKjrn4lcbuyLnOuPmW9uIC0tPiDsnbTrj5nsnbTrgZ3rgqggIyDssKjrn4lcbuy0iOuLueychOy5mOyggOyepSAtLT4g7J2064-Z7J2064Gd64KoICMg7LCo65-JXG7snbTrj5nsnbTrgZ3rgqggLS0-IOyLnOuPmW9mZiAjIOywqOufiVxu7Iuc64-Zb2ZmIC0tPiBbKl0gIyDssKjrn4lcblxuWypdIC0tPiDssKjrn4ntkZzsi5wgIyDshJzruYTsiqRcbiMg7LCo65-J7ZGc7IucIC0tPiDtgqTrtoDsl6wgIyDshJzruYTsiqRcbiMg7YKk67aA7JesIC0tPiDsnbTrj5nsoJXrs7TsoIDsnqUgIyDshJzruYTsiqRcbiMg7J2064-Z7KCV67O07KCA7J6lIC0tPiDtgqTtmozsiJggIyDshJzruYTsiqRcbu2CpO2ajOyImCAtLT4gWypdXG5cblsqXSAtLT4g7JyE7LmY7ZmV7J24ICMg7IKs7Jqp7J6QXG7snITsuZjtmZXsnbggLS0-IOywqOufieygleuztO2ZleyduCAjIOyCrOyaqeyekFxu7LCo65-J7KCV67O07ZmV7J24IC0tPiDrjIDsl6wgIyDsgqzsmqnsnpBcbiMg64yA7JesIC0tPiDtg5HsirkgIyDsgqzsmqnsnpBcbiPtg5HsirkgLS0-IOuwmOuCqSAjIOyCrOyaqeyekFxu67CY64KpIC0tPiDsnbTrj5nqsr3roZztmZXsnbggIyDsgqzsmqnsnpBcbuydtOuPmeqyveuhnO2ZleyduCAtLT4g6rKw7KCcICMg7IKs7Jqp7J6QXG7qsrDsoJwgLS0-IFsqXVxuXG7ssKjrn4ntkZzsi5wgLS0-IOychOy5mO2ZleyduCAjIOyEnOu5hOyKpCAtPiDsgqzsmqnsnpBcbuuMgOyXrCAtLT4g7YKk67aA7JesICMg7IKs7Jqp7J6QIC0-IOyEnOu5hOyKpFxu7YKk67aA7JesIC0tPiDtg5HsirkgIyDshJzruYTsiqQgLT4g7IKs7Jqp7J6QXG7tg5HsirkgLS0-IOyLnOuPmW9uICMg7IKs7Jqp7J6QIC0-IOywqOufiVxu7Iuc64-Zb2ZmIC0tPiDsnbTrj5nsoJXrs7TsoIDsnqUgIyDssKjrn4kgLT4g7ISc67mE7IqkXG7snbTrj5nsoJXrs7TsoIDsnqUgLS0-IOuwmOuCqSAjIOyEnOu5hOyKpCAtPiDsgqzsmqnsnpBcbuqysOygnCAtLT4g7YKk7ZqM7IiYICMg7IKs7Jqp7J6QIC0-IOyEnOu5hOyKpCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoic3RhdGVEaWFncmFtXG5cblsqXSAtLT4g7Iuc64-Zb24gIyDssKjrn4lcbuyLnOuPmW9uIC0tPiDstIjri7nsnITsuZjsoIDsnqUgIyDssKjrn4lcbuyLnOuPmW9uIC0tPiDsnbTrj5nsnbTrgZ3rgqggIyDssKjrn4lcbuy0iOuLueychOy5mOyggOyepSAtLT4g7J2064-Z7J2064Gd64KoICMg7LCo65-JXG7snbTrj5nsnbTrgZ3rgqggLS0-IOyLnOuPmW9mZiAjIOywqOufiVxu7Iuc64-Zb2ZmIC0tPiBbKl0gIyDssKjrn4lcblxuWypdIC0tPiDssKjrn4ntkZzsi5wgIyDshJzruYTsiqRcbiMg7LCo65-J7ZGc7IucIC0tPiDtgqTrtoDsl6wgIyDshJzruYTsiqRcbiMg7YKk67aA7JesIC0tPiDsnbTrj5nsoJXrs7TsoIDsnqUgIyDshJzruYTsiqRcbiMg7J2064-Z7KCV67O07KCA7J6lIC0tPiDtgqTtmozsiJggIyDshJzruYTsiqRcbu2CpO2ajOyImCAtLT4gWypdXG5cblsqXSAtLT4g7JyE7LmY7ZmV7J24ICMg7IKs7Jqp7J6QXG7snITsuZjtmZXsnbggLS0-IOywqOufieygleuztO2ZleyduCAjIOyCrOyaqeyekFxu7LCo65-J7KCV67O07ZmV7J24IC0tPiDrjIDsl6wgIyDsgqzsmqnsnpBcbiMg64yA7JesIC0tPiDtg5HsirkgIyDsgqzsmqnsnpBcbiPtg5HsirkgLS0-IOuwmOuCqSAjIOyCrOyaqeyekFxu67CY64KpIC0tPiDsnbTrj5nqsr3roZztmZXsnbggIyDsgqzsmqnsnpBcbuydtOuPmeqyveuhnO2ZleyduCAtLT4g6rKw7KCcICMg7IKs7Jqp7J6QXG7qsrDsoJwgLS0-IFsqXVxuXG7ssKjrn4ntkZzsi5wgLS0-IOychOy5mO2ZleyduCAjIOyEnOu5hOyKpCAtPiDsgqzsmqnsnpBcbuuMgOyXrCAtLT4g7YKk67aA7JesICMg7IKs7Jqp7J6QIC0-IOyEnOu5hOyKpFxu7YKk67aA7JesIC0tPiDtg5HsirkgIyDshJzruYTsiqQgLT4g7IKs7Jqp7J6QXG7tg5HsirkgLS0-IOyLnOuPmW9uICMg7IKs7Jqp7J6QIC0-IOywqOufiVxu7Iuc64-Zb2ZmIC0tPiDsnbTrj5nsoJXrs7TsoIDsnqUgIyDssKjrn4kgLT4g7ISc67mE7IqkXG7snbTrj5nsoJXrs7TsoIDsnqUgLS0-IOuwmOuCqSAjIOyEnOu5hOyKpCAtPiDsgqzsmqnsnpBcbuqysOygnCAtLT4g7YKk7ZqM7IiYICMg7IKs7Jqp7J6QIC0-IOyEnOu5hOyKpCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)





