*!*	Description:
*!*	 You can use this class for managing value of property LockScreen.

*!*	Using:
*!*  The class has only two method. Push() and Pop()
*!*  Method Push() register form or toolbar and set LockScreen=.T. Next calling increase internal counter.
*!*  Method Pop() decrease internal counter. 
*!*	  If is zero, then will set LockScreen to value which was at first calling method Push()

#DEFINE _LSS_NotRegistered "A form was not register."

DEFINE CLASS _LockScreenStack AS CUSTOM
   Name="_LockScreenStack"
   DIMENSION aKeys(2)
   iCount=0
   aKeys(1)=" "

   PROCEDURE Push
      * 
      * _LockScreenStack::Push
      *
      LPARAMETERS m.loForm

      LOCAL m.lii
      IF NOT PEMSTATUS(m.loForm, "LockScreenIndex", 5)
         m.loForm.AddProperty("LockScreenIndex", 0)
         m.lii=0
      ELSE
         m.lii=m.loForm.LockScreenIndex
      ENDIF
      IF m.lii=0
         #IF VAL(SUBSTR(VERSION(), 15, 2))>=7
          m.lii=ASCAN(This.aKeys, 0, 1, -1, 1, 8)
         #ELSE
          m.lii=ASCAN(This.aKeys, 0, 1, -1)
          m.lii=IIF(m.lii=0, 0, ASUBSCRIPT(This.aKeys, m.lii, 1))
         #ENDIF   
         IF m.lii=0
            STORE This.iCount+1 TO This.iCount, m.lii
            DIMENSION This.aKeys(This.iCount, 2)
         ENDIF
         m.loForm.LockScreenIndex=m.lii
         This.aKeys(m.lii, 1)=1
         This.aKeys(m.lii, 2)=m.loForm.LockScreen
         m.loForm.LockScreen=.T.
      ELSE
         This.aKeys(m.lii, 1)=This.aKeys(m.lii, 1)+1
      ENDIF
   ENDPROC


   PROCEDURE Pop
      * 
      * _LockScreenStack::Pop
      *

      LPARAMETERS m.loForm
      LOCAL m.lii
      IF NOT PEMSTATUS(loForm, "LockScreenIndex", 5)
         ASSERT .F. MESSAGE _LSS_NotRegistered
         RETURN
      ENDIF

      m.lii=m.loForm.LockScreenIndex
      IF m.lii<=0
         ASSERT .F. MESSAGE _LSS_NotRegistered
         RETURN
      ENDIF      
      
      This.aKeys(m.lii, 1)=This.aKeys(m.lii, 1)-1
      IF This.aKeys(m.lii, 1)=0
         m.loForm.LockScreenIndex=0
         m.loForm.LockScreen=This.aKeys(m.lii, 2)
      ENDIF
   ENDPROC

ENDDEFINE