PROGRAM TEST_LOAD_MODEL

USE TYPE_TOTO

IMPLICIT NONE

TYPE (TOTO) :: YLTOTO

!$acc enter data create (YLTOTO) 

WRITE (0, *) __FILE__, ':', __LINE__; CALL FLUSH (0)
!$acc serial present (YLTOTO)
PRINT *, LOC (YLTOTO)
!$acc end serial

CALL COPY_TOTO (YLTOTO)

END PROGRAM
