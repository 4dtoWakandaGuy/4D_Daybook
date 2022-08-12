//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      In ButtLPOut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("In ButtLPOut")

OBJECT SET ENABLED:C1123(xOK; True:C214)
OBJECT SET ENABLED:C1123(xCancel; True:C214)
OBJECT SET ENABLED:C1123(xDelete; True:C214)
OBJECT SET ENABLED:C1123(xSelect; True:C214)
OBJECT SET ENABLED:C1123(xSort; True:C214)
OBJECT SET ENABLED:C1123(xReport; True:C214)
OBJECT SET ENABLED:C1123(xGraph; True:C214)
OBJECT SET ENABLED:C1123(xApply; True:C214)
OBJECT SET ENABLED:C1123(xAny; True:C214)
OBJECT SET ENABLED:C1123(xTel; True:C214)
OBJECT SET ENABLED:C1123(xCount; True:C214)
OBJECT SET ENABLED:C1123(xPlus; True:C214)

OBJECT SET ENABLED:C1123(xSearch; (Not:C34(<>ButtDis="@-Fi@")))
OBJECT SET ENABLED:C1123(xSet; (Not:C34(<>ButtDis="@-Fi@")))

OBJECT SET ENABLED:C1123(xMinus; False:C215)
OBJECT SET ENABLED:C1123(xOpen; False:C215)
OBJECT SET ENABLED:C1123(xPrevRec; False:C215)
OBJECT SET ENABLED:C1123(xNextRec; False:C215)
OBJECT SET ENABLED:C1123(xFirstRec; False:C215)
OBJECT SET ENABLED:C1123(xLastRec; False:C215)


OBJECT SET ENABLED:C1123(xDelete; (Not:C34(<>ButtDis="@Del@")))
OBJECT SET ENABLED:C1123(xPlus; (Not:C34(<>ButtDis="@Plus@")))
OBJECT SET ENABLED:C1123(xApply; (Not:C34(<>ButtDis="@App@")))
OBJECT SET ENABLED:C1123(xAny; (Not:C34(<>ButtDis="@Any@")))
OBJECT SET ENABLED:C1123(xTel; (Not:C34(<>ButtDis="@Tel@")))
OBJECT SET ENABLED:C1123(xReport; (Not:C34(<>ButtDis="@^RG@")))
OBJECT SET ENABLED:C1123(xGraph; (Not:C34(<>ButtDis="@^RG@")))


If (Substring:C12(<>ButtDis; 2; 1)="A")
	OBJECT SET ENABLED:C1123(xDelete; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	
	OBJECT SET ENABLED:C1123(xReporT; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xGraph; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xApply; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xAny; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xTel; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xCount; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xSearch; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xSelect; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xSort; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
	OBJECT SET ENABLED:C1123(xSet; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="A")))
Else 
	OBJECT SET ENABLED:C1123(xAny; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="M")))
	OBJECT SET ENABLED:C1123(xTel; (Not:C34(Substring:C12(<>ButtDis; 2; 1)="M")))
	OBJECT SET ENABLED:C1123(xDelete; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xPlus; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xReport; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xGraph; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xApply; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xAny; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
	OBJECT SET ENABLED:C1123(xTel; (Not:C34(Substring:C12(<>ButtDis; 3; 1)="S")))
End if 
ERR_MethodTrackerReturn("In ButtLPOut"; $_t_oldMethodName)
