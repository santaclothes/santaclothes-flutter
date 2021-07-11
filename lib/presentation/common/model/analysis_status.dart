/// REQUEST : 사용자가 라벨 분석 요청을 보냈을 경우
/// CLASSIFIED : 관리자(admin) 페이지에서 라벨 정보를 입력 마친 경우
/// NOTIFIED : 서버에서 사용자 휴대폰으로 푸시메시지를 성공적으로 보냈을 경우(단, 푸시메시지를 보내는데 실패할 경우 REQUEST 상태로 돌아간다.)
/// DELETED : 마이페이지 삭제, 나의 보관함에 저장하지 않기 기능 위한 상태
/// DONE : 나의 보관함에 저장하기 기능을 위한 상태
/// REPORTED : 오류 레포트 보내기 기능을 위한 상태

enum AnalysisStatus { REQUEST, CLASSIFIED, NOTIFIED, DELETED, DONE, REPORTED }

extension ParseToString on AnalysisStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
