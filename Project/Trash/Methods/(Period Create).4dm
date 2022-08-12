//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Period Create
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 16:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_4DDigitYear; $_bo_Auto; $3)
	C_DATE:C307(<>DB_d_CurrentDate; $1; vDate; vDate2)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Index; $_l_Month; $_l_Process; $2; vNo)
	C_TEXT:C284($_t_MonthName; $_t_oldMethodName; $_t_Prefix; $_t_Year; vPeriod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period Create")
//Period Create

vPeriod:=""
If (Count parameters:C259=0)
	vDate:=Date_FromNums(1; 1; Year of:C25(<>DB_d_CurrentDate))
Else 
	vDate:=$1
	
End if 
If (Count parameters:C259>=2)
	vNo:=$2
Else 
	vNo:=12
End if 
If (Count parameters:C259>=3)
	$_bo_Auto:=$3
Else 
	$_bo_Auto:=False:C215
End if 
If (Not:C34($_bo_Auto))
	vDate:=Date:C102(Gen_Request("Start Date:"; String:C10(vDate)))
End if 
If (OK=1)
	
	If (Not:C34($_bo_Auto))
		vNo:=Num:C11(Gen_Request("No. of Periods:"; String:C10(vNo)))
	End if 
	If (OK=1)
		//removing the option!!!
		//Gen_Confirm ("Do you want to create yyyy/mm or yy/mm Periods?";"yyyy/mm";"yy/mm")
		$_bo_4DDigitYear:=True:C214
		//$_l_Index:=1
		$_l_Process:=Current process:C322
		<>SYS_l_CancelProcess:=0
		While (($_l_Index<=vNo) & (<>SYS_l_CancelProcess#$_l_Process))
			IDLE:C311  // 7/04/03 pb
			$_l_Month:=(Month of:C24(vDate))
			If ($_l_Month<10)
				$_t_Prefix:="0"
			Else 
				$_t_Prefix:=""
			End if 
			If ($_bo_4DDigitYear)
				vPeriod:=String:C10(Year of:C25(vDate))+"/"+$_t_Prefix+String:C10($_l_Month)
			Else 
				$_t_Year:=Substring:C12(String:C10(Year of:C25(vDate)); 3; 2)
				If (Substring:C12($_t_Year; 1; 1)="0")
					$_t_Year:="A"+Substring:C12($_t_Year; 2; 1)
				End if 
				vPeriod:=$_t_Year+"/"+$_t_Prefix+String:C10($_l_Month)
			End if 
			//lines added NG Feb 2004
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=vDate; *)
			vDate2:=vDate+35
			vDate2:=Date_FromNums(1; Month of:C24(vDate2); Year of:C25(vDate2))
			vDate2:=vDate2-1
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=vDate2)
			If (Records in selection:C76([PERIODS:33])=0)  //do not create overlapping periods
				
				CREATE RECORD:C68([PERIODS:33])
				[PERIODS:33]NL_Closed:5:=True:C214
				[PERIODS:33]SL_Closed:7:=True:C214
				[PERIODS:33]PL_Closed:8:=True:C214
				[PERIODS:33]Period_Code:1:=vPeriod
				$_t_MonthName:=MonthName(vDate)
				[PERIODS:33]Period_Name:2:=$_t_MonthName+" "+String:C10(Year of:C25(vDate))
				[PERIODS:33]From_Date:3:=vDate
				vDate:=vDate+35
				vDate:=Date_FromNums(1; Month of:C24(vDate); Year of:C25(vDate))
				vDate:=vDate-1
				[PERIODS:33]To_Date:4:=vDate
				vDate:=vDate+1
				[PERIODS:33]Profit_Posted:9:=True:C214
				DB_SaveRecord(->[PERIODS:33])
				AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
			Else 
				vDate:=vDate+35
				vDate:=Date_FromNums(1; Month of:C24(vDate); Year of:C25(vDate))
				vDate:=vDate-1
				
			End if 
			
			$_l_Index:=$_l_Index+1
		End while 
	End if 
End if 
ALL RECORDS:C47([PERIODS:33])
vNo:=Records in selection:C76([PERIODS:33])
ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
ERR_MethodTrackerReturn("Period Create"; $_t_oldMethodName)
