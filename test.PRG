LOCAL m.lcPath

m.lcPath=SYS(16)
m.lcPath=IIF(RAT("\", m.lcPath)>0, LEFT(m.lcPath, RAT("\", m.lcPath)), m.lcPath)

SET PROCEDURE TO (m.lcPath+"lockscreenstack") ADDITIVE

PRIVATE m.loForm
m.loo=CREATEOBJECT("_LockScreenStack")
m.loo.Push(_Screen)
m.loo.Push(_Screen)

m.loForm=CREATEOBJECT("FORM")
m.loo.Push(m.loForm)

m.loo.Pop(_Screen)
m.loo.Pop(_Screen)

m.loo.Pop(m.loForm)
