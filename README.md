# 아파트 경품 추첨 시스템 (Raffle System)

신비한 페스티벌 추첨을 위한 웹 간단한 애플리케이션입니다.

## 기능

- 여러 페스티벌 선택 가능
- 동/호수 자동 추첨
- 애니메이션 효과가 있는 숫자 표시
- 실시간 추첨 결과 표시

## 기술 스택

- Flutter
- Dart
- HTTP API 통신

## 프로젝트 구조

```
lib/
├── models/
│   ├── festival.dart    # 페스티벌 데이터 모델
│   └── winner.dart      # 당첨자 데이터 모델
├── services/
│   └── raffle_service.dart  # API 통신 서비스
├── widgets/
│   ├── festival_dropdown.dart  # 페스티벌 선택 드롭다운
│   ├── draw_button.dart        # 추첨 버튼
│   └── number_display.dart     # 숫자 표시 컴포넌트
└── main.dart                    # 메인 애플리케이션
```

## 설치 및 실행

1. Flutter 개발 환경 설정
```bash
flutter doctor
```

2. 의존성 설치
```bash
flutter pub get
```

3. 애플리케이션 실행
```bash
flutter run -d chrome
```

## API 엔드포인트

- 추첨 API: `https://dev-rs.hence.world/api/v2/festivals/{festivalId}/raffles/{raffleId}/draw`

## 환경 변수

- API 기본 URL: `https://dev-rs.hence.world/api/v2`
