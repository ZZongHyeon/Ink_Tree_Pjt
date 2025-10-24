CREATE OR REPLACE TRIGGER TRG_COMMENT_STEP
BEFORE INSERT ON board_comment
FOR EACH ROW
BEGIN
    SELECT NVL(MAX(commentSubStepNumber), 0) + 1
    INTO :NEW.commentSubStepNumber
    FROM board_comment
    WHERE commentSubNumber = :NEW.commentSubNumber;
END;