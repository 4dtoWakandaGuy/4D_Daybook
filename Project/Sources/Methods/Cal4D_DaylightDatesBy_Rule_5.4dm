//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_DaylightDatesBy_Rule_5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_1stDayNo)
	C_TEXT:C284($_t_DtTiStr; $_t_MethodName; $_t_Mon; $_t_oldMethodName; $_t_Request; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DaylightDatesBy_Rule_5")

$_d_Date:=Current date:C33(*)
$_t_Request:=$1
$_t_DtTiStr:=String:C10(Year of:C25($_d_Date))


Case of 
	: ($_t_Request="StartDate")
		////  starts on the third Sunday in October
		$_t_Mon:=String:C10(October:K10:10; "00")
		$_l_1stDayNo:=Day number:C114(Date:C102($_t_Mon+"/01/"+String:C10(Year of:C25($_d_Date))))
		$_t_DtTiStr:=$_t_DtTiStr+$_t_Mon
		Case of 
			: ($_l_1stDayNo=Monday:K10:13)
				$_t_DtTiStr:=$_t_DtTiStr+"21"
				
			: ($_l_1stDayNo=Tuesday:K10:14)
				$_t_DtTiStr:=$_t_DtTiStr+"20"
				
			: ($_l_1stDayNo=Wednesday:K10:15)
				$_t_DtTiStr:=$_t_DtTiStr+"19"
				
			: ($_l_1stDayNo=Thursday:K10:16)
				$_t_DtTiStr:=$_t_DtTiStr+"18"
				
			: ($_l_1stDayNo=Friday:K10:17)
				$_t_DtTiStr:=$_t_DtTiStr+"17"
				
			: ($_l_1stDayNo=Saturday:K10:18)
				$_t_DtTiStr:=$_t_DtTiStr+"16"
				
			: ($_l_1stDayNo=Sunday:K10:19)
				$_t_DtTiStr:=$_t_DtTiStr+"15"
				
		End case 
		$_t_DtTiStr:=$_t_DtTiStr+"T020000"
		
	: ($_t_Request="StartRule")
		////  starts on the third Sunday in October
		$_t_DtTiStr:="BYMONTH="+String:C10(October:K10:10)+";BYDAY=3SU"
		
	: ($_t_Request="EndDate")
		$_t_Mon:=String:C10(February:K10:2; "00")
		$_l_1stDayNo:=Day number:C114(Date:C102($_t_Mon+"/01/"+String:C10(Year of:C25($_d_Date))))
		////  and ends on the third Sunday in February.
		$_t_DtTiStr:=$_t_DtTiStr+$_t_Mon
		Case of 
			: ($_l_1stDayNo=Monday:K10:13)
				$_t_DtTiStr:=$_t_DtTiStr+"21"
				
			: ($_l_1stDayNo=Tuesday:K10:14)
				$_t_DtTiStr:=$_t_DtTiStr+"20"
				
			: ($_l_1stDayNo=Wednesday:K10:15)
				$_t_DtTiStr:=$_t_DtTiStr+"19"
				
			: ($_l_1stDayNo=Thursday:K10:16)
				$_t_DtTiStr:=$_t_DtTiStr+"18"
				
			: ($_l_1stDayNo=Friday:K10:17)
				$_t_DtTiStr:=$_t_DtTiStr+"17"
				
			: ($_l_1stDayNo=Saturday:K10:18)
				$_t_DtTiStr:=$_t_DtTiStr+"16"
				
			: ($_l_1stDayNo=Sunday:K10:19)
				$_t_DtTiStr:=$_t_DtTiStr+"15"
				
		End case 
		$_t_DtTiStr:=$_t_DtTiStr+"T020000"
		
	: ($_t_Request="EndRule")
		////  and ends on the third Sunday in February.
		$_t_DtTiStr:="BYMONTH="+String:C10(February:K10:2)+";BYDAY=3SU"
		
End case 


$0:=$_t_DtTiStr
ERR_MethodTrackerReturn("Cal4D_DaylightDatesBy_Rule_5"; $_t_oldMethodName)