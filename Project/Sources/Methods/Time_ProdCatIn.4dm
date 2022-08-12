//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_ProdCatIn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(i)
	//ARRAY BOOLEAN(PER_abo_AdHocBudget;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(aPrevTypeC;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_DATE:C307(<>TimeYear; vDateF; vDateT)
	C_LONGINT:C283($_l_Index; $_l_SelectedRow)
	C_POINTER:C301($2)
	C_REAL:C285($_r_InUnits; $_r_InValue; vAmount; vPrice; vValueT)
	C_TEXT:C284($_t_oldMethodName; $1; vCharge; vFld)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_ProdCatIn")
$_r_InUnits:=0
$_r_InValue:=0
$_l_Index:=1
While ($_l_Index<=Size of array:C274(SVS_at_PreviewNote))
	IDLE:C311  // 7/04/03 pb
	If (aPrevTypeC{$_l_Index}=vCharge)
		Case of 
			: ($1="Week")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=SVS_at_PreviewNote{$_l_Index}; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Code:11=[RESULTS:14]Result_Code:1; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=vDateF; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vDateT)
				$_r_InUnits:=$_r_InUnits+Sum:C1([DIARY:12]Units:20)
				$_r_InValue:=$_r_InValue+Sum:C1([DIARY:12]Value:16)
			: ($1="YTD@")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=SVS_at_PreviewNote{$_l_Index}; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Code:11=[RESULTS:14]Result_Code:1; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=<>TimeYear; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vDateT)
				$_r_InUnits:=$_r_InUnits+Sum:C1([DIARY:12]Units:20)
				$_r_InValue:=$_r_InValue+Sum:C1([DIARY:12]Value:16)
			: ($1="Bud@")
				QUERY:C277([TIME_BUDGETS:49]; [TIME_BUDGETS:49]Person:1=SVS_at_PreviewNote{$_l_Index}; *)
				QUERY:C277([TIME_BUDGETS:49];  & ; [TIME_BUDGETS:49]Result_Code:3=[RESULTS:14]Result_Code:1)
				If (PER_abo_AdHocBudget{$_l_Index}=False:C215)
					Time_ProdBud2
				Else 
					vPrice:=[TIME_BUDGETS:49]Budget_Units:4
				End if 
				$_r_InUnits:=$_r_InUnits+vPrice
				$_r_InValue:=$_r_InValue+(vPrice*GEN_ar_Value{$_l_Index})
		End case 
	End if 
	$_l_Index:=$_l_Index+1
End while 
vAmount:=vAmount+$_r_InUnits
vValueT:=vValueT+$_r_InValue
SEND PACKET:C103(String:C10($_r_InUnits)+vFld)
If (Count parameters:C259>=2)
	$_l_SelectedRow:=$2->
Else 
	//$_l_SelectedRow:=i
	ALERT:C41("ERROR!!!!-OLD CODE")
End if 
Case of 
	: ($1="Week")
		SRRate{$_l_SelectedRow}:=SRRate{$_l_SelectedRow}+$_r_InUnits
		$_l_SelectedRow:=$_l_SelectedRow+1
	: ($1="YTD@")
		SRAmount{$_l_SelectedRow}:=SRAmount{$_l_SelectedRow}+$_r_InUnits
		$_l_SelectedRow:=$_l_SelectedRow+1
	: ($1="Bud@")
		GEN_ar_Value{i}:=GEN_ar_Value{$_l_SelectedRow}+$_r_InUnits
		$_l_SelectedRow:=$_l_SelectedRow+1
End case 
If (Count parameters:C259>=2)
	$2->:=$_l_SelectedRow
Else 
	//i:=$_l_SelectedRow
End if 
ERR_MethodTrackerReturn("Time_ProdCatIn"; $_t_oldMethodName)
