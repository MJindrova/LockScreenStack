# LockScreen Stack

You can use this class for managing value of property LockScreen.
 The class has only two method.
 `Push()` and `Pop()` Method `Push()` register form or toolbar and set `LockScreen=.T.`
 Next calling increase internal counter.
 Method `Pop()` decrease internal counter. If is zero, then will set LockScreen to value which was at first calling method `Push()`.

## VFP Compatibility
VFP 6 SP3, VFP 7, VFP 8, VFP 9, VFP Advanced, VFP Advanced 64 bit

## Files
lockscreenstack.PRG - main program
test.PRG - a little example


## Examples

### Example 1 
```foxpro
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
```
