If (False:C215)
	//object Name: [USER]Error_Report.oButPrint1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284($_t_CarriageReturnLineFeed; $_t_CarriageReturnLineFeedx2; $_t_oldMethodName; Err_T_DetailText; Err_T_ErrReportPrintout; Err_T_UserText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Error_Report.oButPrint1"; Form event code:C388)

$_t_CarriageReturnLineFeed:=Char:C90(13)+Char:C90(10)
$_t_CarriageReturnLineFeedx2:=$_t_CarriageReturnLineFeed+$_t_CarriageReturnLineFeed
Err_T_ErrReportPrintout:="Report Details"+$_t_CarriageReturnLineFeedx2+Err_T_DetailText
If (Err_T_UserText#"")
	Err_T_ErrReportPrintout:=Err_T_ErrReportPrintout+$_t_CarriageReturnLineFeedx2+"Added Comments"+$_t_CarriageReturnLineFeedx2+Err_T_UserText
End if 
FORM SET OUTPUT:C54([USER:15]; "ErrorReportPrint")
FORM SET INPUT:C55([USER:15]; "ErrorReportPrint")
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
REDUCE SELECTION:C351([USER:15]; 1)
PRINT RECORD:C71([USER:15])
REDUCE SELECTION:C351([USER:15]; 0)
ERR_MethodTrackerReturn("OBJ [USER].Error_Report.oButPrint1"; $_t_oldMethodName)