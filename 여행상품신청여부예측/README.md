# ✈️여행 상품 신청 여부 예측
[데이콘 Basic](https://dacon.io/competitions/official/235959/overview/description)에서 진행한 여행 상품 신청 여부 예측 경진대회
***
## 목적 및 심사 기준
- 목적 : 나이, 성별, 월 수입 등의 고객 데이터를 이용해서 여행 상품 신청 여부를 예측
- 심사 기준 : accuracy(실제 데이터에서 예측 데이터가 얼마나 같은지 판단하는 지표)
## 머신러닝
- 최종 제출 점수 : 0.88
- 사용해 본 머신러닝 : Logistic Regression, Random Forest
- [시도 1](https://github.com/nxkyoungeun/DataStudy/blob/main/%EC%97%AC%ED%96%89%EC%83%81%ED%92%88%EC%8B%A0%EC%B2%AD%EC%97%AC%EB%B6%80%EC%98%88%EC%B8%A1/%EC%8B%9C%EA%B0%81%ED%99%94_LogisticRegression.ipynb) : 라벨 인코딩 후 Logistic Regression
  - 결측치 처리 : 컬럼이 숫자형 변수인 경우에는 0으로, 문자형인 경우에는 "Unknown"을 사용
  - 최종 점수 : 0.83
- [시도 2](https://github.com/nxkyoungeun/DataStudy/blob/main/%EC%97%AC%ED%96%89%EC%83%81%ED%92%88%EC%8B%A0%EC%B2%AD%EC%97%AC%EB%B6%80%EC%98%88%EC%B8%A1/_RandomForest01.ipynb) : 라벨 인코딩, MinMax 스케일링 후 Random Forest
  - 결측치 처리 : 
    - Age(나이), NumberOfFollowups(영업 사원의 프레젠테이션 후 이루어진 후속 조치 수), PreferredPropertyStar(선호 호텔 숙박업소 등급), NumberOfTrips(평균 연간 여행 횟수), NumberOfChildrenVisiting(함께 여행을 계획 중인 5세 미만의 어린이 수), MonthlyIncome(월 급여) : 평균 값(mean)
    - TypeofContact(고객의 제품 인지 방법 (회사의 홍보 or 스스로 검색)) : "Unknown"
    - DurationOfPitch(영업 사원이 고객에게 제공하는 프레젠테이션 기간) : 0
  - 최종 점수 : 0.88
- [시도 3](https://github.com/nxkyoungeun/DataStudy/blob/main/%EC%97%AC%ED%96%89%EC%83%81%ED%92%88%EC%8B%A0%EC%B2%AD%EC%97%AC%EB%B6%80%EC%98%88%EC%B8%A1/_RandomForest02.ipynb) : 라벨 인코딩, MinMax 스케일링 후 Random Forest
  - 결측치 처리 : 
    - Age(나이) : Designation((직업의) 직급)과 관련있다 생각하고 Age가 Na인 데이터의 Designation을 확인하고 Designation에 맞는 평균 나이를 넣어줌
    - 나머지 결측치는 시도 2와 같은 처리 방법을 사용
  - 불필요한 컬럼 삭제 : id 컬럼, 영업사원의 프레젠테이션과 만족도는 큰 영향을 미치지 못하므로 제거
  - grid search 를 사용하여 최적의 파라미터 탐색 : 
    - 베스트 평균 정확도 :  0.8517
    - 베스트 파라미터 : {'max_depth': 12, 'min_samples_leaf': 3, 'min_samples_split': 3, 'n_estimators': 200}
  - 최종 점수 : 0.84
- 느낀점 : 학습을 시키기 전 필요한 컬럼과 불필요한 컬럼을 구별하기 위한 더 자세한 데이터 분석이 필요합니다. 이후 학습에 사용할 컬럼을 재선정하고 Random Forest를 제외한 앙상블 모델을 시도해 더 발전시켜 나갈 예정입니다.

## 데이터 분석
- 여행 상품을 기획과 현재 영업 방향을 개선하기 위한 방법을 제시했습니다.[🔗링크](https://github.com/nxkyoungeun/DataStudy/blob/main/%EC%97%AC%ED%96%89%EC%83%81%ED%92%88%EC%8B%A0%EC%B2%AD%EC%97%AC%EB%B6%80%EC%98%88%EC%B8%A1/%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D.ipynb)
- 현재 데이터를 바탕으로 연령대별 여행 상품을 기획한다면 패키지를 어떻게 구성해야하는지 알아보았습니다.
- 현재 데이터를 확인해 보면 영업사원이 프레젠테이션을 통해 영업을 합니다. 그렇다면 현재 여행 상품의 신청자를 늘리려면 영업사원의 프레젠테이션이 어떤 방향으로 개선되어야 할지 알아보았습니다.
