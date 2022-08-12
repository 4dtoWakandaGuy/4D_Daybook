//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateOLD; vDate)
	C_TEXT:C284($_t_DefaultDateSTR; $_t_oldMethodName; $_t_SearchDateSTR; vLongDate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryDate")
//Diary_DiaryDate
$_t_DefaultDateSTR:=String:C10(<>DB_d_CurrentDate)
$_t_SearchDateSTR:=Substring:C12(Gen_Request("Date:"; $_t_DefaultDateSTR); 1; 51)
If (OK=1)
	$_d_DateOLD:=vDate
	vDate:=Diary_SelDate($_t_SearchDateSTR)
	COPY NAMED SELECTION:C331([DIARY:12]; "Selection")
	Diary_DateSrch
	If (Records in selection:C76([DIARY:12])=0)
		Gen_Alert("No Diary Items found for "+String:C10(vDate)+" - the selection is unchanged"; "OK")
		USE NAMED SELECTION:C332("Selection")
		vDate:=$_d_DateOLD
		Long_Date2
		vLongDate:=vLongDate+"  "+Lowercase:C14(String:C10(Current time:C178; 5))
	End if 
	CLEAR NAMED SELECTION:C333("Selection")
End if 
ERR_MethodTrackerReturn("Diary_DiaryDate"; $_t_oldMethodName)