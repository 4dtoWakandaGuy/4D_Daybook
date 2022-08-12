//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls OutCount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_Value)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
	C_TIME:C306($_ti_ElapsedTime; $_ti_ResponseTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls OutCount")
$_r_Value:=Sum:C1([SERVICE_CALLS:20]Value:12)
$_ti_ElapsedTime:=Sum:C1([SERVICE_CALLS:20]Elapsed_Time:19)
$_ti_ResponseTime:=Sum:C1([SERVICE_CALLS:20]Response_Time:21)
vText:=vText+"Total Value: "+String:C10($_r_Value; "|Accounts")+vRec+"Elapsed Time: "+String:C10($_ti_ElapsedTime; 2)+vRec+"Response Time: "+String:C10($_ti_ResponseTime; 2)
ERR_MethodTrackerReturn("Calls OutCount"; $_t_oldMethodName)