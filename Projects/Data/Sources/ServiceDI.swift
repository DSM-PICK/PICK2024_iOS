import Domain

public struct ServiceDI {
    public static let shared = resolve()

    // Auth
    public let loginUseCase: LoginUseCase
    
    //profile
    public let fetchSimpleUseCase: FetchSimpleProfileUseCase
    public let fetchDetailUseCase: FetchDetailProfileUseCase
    
    //outing
    public let outingApplyUseCase: OutingApplyUseCase
    public let fetchOutingPassUseCase: FetchOutingPassUseCase
    
    //earlyLeave
    public let earlyLeaveUseCase: EarlyLeaveApplyUseCase
    
    //classroom
    public let classroomMoveUseCase: ClassroomMoveApplyUseCase
    public let fetchClassroomCheckUseCase: FetchClassroomCheckUseCase
    public let classroomReturn: ClassroomReturnUseCase
    
    //weekendMeal
    public let weekendMealCheckUseCase: WeekendMealCheckUseCase
    public let weekendMealApplyUseCase: WeekendMealApplyUseCase
    
    //selfStudyTeacher
    public let fetchSelfStudyTeacherUseCase: FetchSelfStudyTeacherUseCase
    
    //notice
    public let fetchTodayNoticeListUseCase: FetchTodayNoticeListUseCase
    public let fetchNoticeListUseCase: FetchNoticeListUseCase
    public let fetchDetailNoticeUseCase: FetchDetailNoticeUseCase
    
    //schedule
    public let fetchMonthAcademicScheduleUseCase: FetchMonthAcademicScheduleUseCase
    public let fetchTodayTimeTableUseCase: FetchTodayTimeTableUseCase
    public let fetchWeekTimeTableUseCase: FetchWeekTimeTableUseCase
    
    //schoolMeal
    public let fetchSchoolMealUseCase: FetchSchoolMealUseCase
}

extension ServiceDI {
    private static func resolve() -> ServiceDI {
        let authRepo = AuthRepositoryImpl()
        let profileRepo = ProfileRepositoryImpl()
        let outingRepo = OutingRepositoryImpl()
        let earlyLeaveRepo = EarlyLeaveRepositoryImpl()
        let classroomRepo = ClassroomRepositoryImpl()
        let weekendMealRepo = WeekendMealRepositoryImpl()
        let selfStudyTeacherRepo = SelfStudyTeacherRepositoryImpl()
        let noticeRepo = NoticeRepositoryImpl()
        let scheduleRepo = ScheduleRepositoryImpl()
        let schoolMealRepo = SchoolMealRepositoryImpl()

        //MARK: Auth관련 UseCase
        let loginUseCaseInject = LoginUseCase(
            repository: authRepo
        )
        
        //MARK: Profile관련 UseCase
        let fetchSimpleProfileUseCaseInject = FetchSimpleProfileUseCase(
            repository: profileRepo
        )
        let fetchDetailProfileUseCaseInject = FetchDetailProfileUseCase(
            repository: profileRepo
        )
        
        //MARK: 외출 관련 UseCase
        let outingApplyUseCaseInject = OutingApplyUseCase(
            repository: outingRepo
        )
        
        let fetchOutingPassUseCaseInject = FetchOutingPassUseCase(
            repository: outingRepo
        )
        
        //MARK: 조기귀가 관련 UseCase
        let earlyLeaveApplyUseCaseInject = EarlyLeaveApplyUseCase(
            repository: earlyLeaveRepo
        )
        
        //MARK: 교실 이동 관련 UseCase
        let classroomMoveApplyUseCaseInject = ClassroomMoveApplyUseCase(
            repository: classroomRepo
        )
        
        let fetchClassroomCheckUseCaseInject = FetchClassroomCheckUseCase(
            repository: classroomRepo
        )
        
        let classroomReturnUseCaseInject = ClassroomReturnUseCase(
            repository: classroomRepo
        )
        
        //MARK: 주말 급식 관련 UseCase
        let weekendMealCheckUseCaseInject = WeekendMealCheckUseCase(
            repository: weekendMealRepo
        )
        
        let weekendMealApplyUseCaseInject = WeekendMealApplyUseCase(
            repository: weekendMealRepo
        )
        
        //MARK: 자습 감독 관련 UseCase
        let fetchSelfStudyTeacherUseCaseInject = FetchSelfStudyTeacherUseCase(
            repository: selfStudyTeacherRepo
        )
        
        //MARK: 공지 관련 UseCase
        let fetchTodayNoticeListUseCaseInject = FetchTodayNoticeListUseCase(
            repository: noticeRepo
        )
        
        let fetchNoticeListUseCaseInject = FetchNoticeListUseCase(
            repository: noticeRepo
        )
        
        let fetchDetailNoticeUseCaseInject = FetchDetailNoticeUseCase(
            repository: noticeRepo
        )
        
        //MARK: 일정 관련 UseCase
        let fetchMonthAcademicUseCaseInject = FetchMonthAcademicScheduleUseCase(
            repository: scheduleRepo
        )
        
        let fetchTodayTimeTableUseCaseInject = FetchTodayTimeTableUseCase(
            repository: scheduleRepo
        )
        
        let fetchWeekTimeTableUseCaseInject = FetchWeekTimeTableUseCase(
            repository: scheduleRepo
        )
        
        //MARK: 급식 관련 UseCase
        let fetchSchoolMealUseCaseInject = FetchSchoolMealUseCase(
            repository: schoolMealRepo
        )
        
        return .init(
            loginUseCase: loginUseCaseInject,
            fetchSimpleUseCase: fetchSimpleProfileUseCaseInject,
            fetchDetailUseCase: fetchDetailProfileUseCaseInject,
            outingApplyUseCase: outingApplyUseCaseInject,
            fetchOutingPassUseCase: fetchOutingPassUseCaseInject,
            earlyLeaveUseCase: earlyLeaveApplyUseCaseInject,
            classroomMoveUseCase: classroomMoveApplyUseCaseInject,
            fetchClassroomCheckUseCase: fetchClassroomCheckUseCaseInject,
            classroomReturn: classroomReturnUseCaseInject,
            weekendMealCheckUseCase: weekendMealCheckUseCaseInject,
            weekendMealApplyUseCase: weekendMealApplyUseCaseInject,
            fetchSelfStudyTeacherUseCase: fetchSelfStudyTeacherUseCaseInject,
            fetchTodayNoticeListUseCase: fetchTodayNoticeListUseCaseInject,
            fetchNoticeListUseCase: fetchNoticeListUseCaseInject,
            fetchDetailNoticeUseCase: fetchDetailNoticeUseCaseInject,
            fetchMonthAcademicScheduleUseCase: fetchMonthAcademicUseCaseInject,
            fetchTodayTimeTableUseCase: fetchTodayTimeTableUseCaseInject,
            fetchWeekTimeTableUseCase: fetchWeekTimeTableUseCaseInject,
            fetchSchoolMealUseCase: fetchSchoolMealUseCaseInject
        )
    }
    
}
