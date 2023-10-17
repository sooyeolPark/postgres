1. volume을 통하여 local data와 container안의 데이터를 연동시켜 도커를 종료하더라도 데이터가 유지되도록 해준다.
2. docker container 안 /docker-entrypoint-initdb.d에 sql과 sh등을 넣어주면 build 할때 해당 sql이나 쉘 스크립트를 실행해준다.
   1. init.sh로 유저를 만들고 권한을 주는 행위들을 미리 해놓는다.
   2. init.sql로 테스트 데이터를 집어넣을 수 있다.
      3. 다만 이 곳에 있는 sql은 volume으로 잡힌 data가 없을 시에 실행되며 volume안에 기존 데이터가 있으면 실행되지 않는다.
   3. 윈도우에서 실행하면 /docker-entrypoint-initdb.d/ cannot execute: required file not found 라는 에러가 나올때가 있는데 이때 sh파일과 sql파일을 CRLF형식에서 LF형식으로 저장해주면 된다.