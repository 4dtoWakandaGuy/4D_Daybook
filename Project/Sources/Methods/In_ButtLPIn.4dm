//%attributes = {}
If (False:C215)
	//Project Method Name:      In_ButtLPIn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 18:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xAny; xApply; xCancel; xCount; xDelete; xFirstRec; xGraph; xLastRec; xMinus; xNextRec; xOK)
	C_LONGINT:C283(xOpen; xPlus; xPrevRec; xReport; xSearch; xSelect; xSet; xSort; xTel)
	C_TEXT:C284(<>ButtDis; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_ButtLPIn")  //NG April 2011-not called

OBJECT SET ENABLED:C1123(xOK; True:C214)
OBJECT SET ENABLED:C1123(xCancel; True:C214)
OBJECT SET ENABLED:C1123(xDelete; True:C214)
OBJECT SET ENABLED:C1123(xPrevRec; True:C214)
OBJECT SET ENABLED:C1123(xNextRec; True:C214)
OBJECT SET ENABLED:C1123(xFirstRec; True:C214)
OBJECT SET ENABLED:C1123(xLastRec; True:C214)

OBJECT SET ENABLED:C1123(xSearch; (<>ButtDis="@+Fi@"))
OBJECT SET ENABLED:C1123(xSelect; True:C214)

OBJECT SET ENABLED:C1123(xSort; (<>ButtDis="@+So@"))
OBJECT SET ENABLED:C1123(xCount; (<>ButtDis="@+So@"))

OBJECT SET ENABLED:C1123(xSet; False:C215)
OBJECT SET ENABLED:C1123(xReport; False:C215)
OBJECT SET ENABLED:C1123(xGraph; False:C215)
OBJECT SET ENABLED:C1123(xApply; False:C215)
OBJECT SET ENABLED:C1123(xAny; False:C215)
OBJECT SET ENABLED:C1123(xTel; (<>ButtDis="@+Te@"))
If (<>ButtDis="@?PO@")
	OBJECT SET ENABLED:C1123(xMinus; (<>ButtDis="@?POM@"))
	OBJECT SET ENABLED:C1123(xPlus; (<>ButtDis="@?POM@"))
	OBJECT SET ENABLED:C1123(xMinus; (<>ButtDis="@?PO@"))
	OBJECT SET ENABLED:C1123(xPlus; (<>ButtDis="@?PO@"))
End if 
If (<>ButtDis="@?PM@")
	OBJECT SET ENABLED:C1123(xMinus; (<>ButtDis="@?PM@"))
	OBJECT SET ENABLED:C1123(xPlus; (<>ButtDis="@?PM@"))
End if 
OBJECT SET ENABLED:C1123(xOpen; False:C215)
OBJECT SET ENABLED:C1123(xDelete; (<>ButtDis="@Del@"))



OBJECT SET ENABLED:C1123(xSearch; (Not:C34(<>ButtDis="@Add@")))
OBJECT SET ENABLED:C1123(xDelete; (Not:C34(<>ButtDis="@Add@")))
OBJECT SET ENABLED:C1123(xPrevRec; (Not:C34(<>ButtDis="@Add@")))
OBJECT SET ENABLED:C1123(xNextRec; (Not:C34(<>ButtDis="@Add@")))
OBJECT SET ENABLED:C1123(xFirstRec; (Not:C34(<>ButtDis="@Add@")))
OBJECT SET ENABLED:C1123(xLastRec; (Not:C34(<>ButtDis="@Add@")))


OBJECT SET ENABLED:C1123(xDelete; (Not:C34(<>ButtDis="@*RO@")))
OBJECT SET ENABLED:C1123(xPlus; (Not:C34(<>ButtDis="@*RO@")))
OBJECT SET ENABLED:C1123(xMinus; (Not:C34(<>ButtDis="@*RO@")))
OBJECT SET ENABLED:C1123(xPrevRec; (Not:C34(<>ButtDis="@&Ar@")))
OBJECT SET ENABLED:C1123(xNextRec; (Not:C34(<>ButtDis="@&Ar@")))
OBJECT SET ENABLED:C1123(xFirstRec; (Not:C34(<>ButtDis="@&Ar@")))
OBJECT SET ENABLED:C1123(xLastRec; (Not:C34(<>ButtDis="@&Ar@")))
ERR_MethodTrackerReturn("In_ButtLPIn"; $_t_oldMethodName)
