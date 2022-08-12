//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Upd4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentProcess; $_l_FieldRow; $_l_TablePosition; $1)
	C_POINTER:C301($_ptr_Field4; $_ptr_Table)
	C_REAL:C285($_r_Max; $_r_Min; $_r_Sum; vAmount; vSVT4)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; vMTitle2; vSVField4Ex)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("StatsView Upd4")

Load_Fields

If (SV_at_FieldName4{SV_at_FieldName4}="Formula")
	$_l_CurrentProcess:=Current process:C322
	$_ptr_Table:=Table:C252(SV_al_TableNumber{DB_at_TableName})
	$_r_Sum:=0
	$_r_Max:=0
	If (Records in selection:C76($_ptr_Table->)=0)
		$_r_Min:=0
	Else 
		$_r_Min:=999999999
		//ON ERR CALL("Error_Macro")
		vMTitle2:=vSVField4Ex
		FIRST RECORD:C50($_ptr_Table->)
		While ((Not:C34(End selection:C36($_ptr_Table->))) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vAmount:="+vSVField4Ex)
			EXECUTE FORMULA:C63("vAmount:="+vSVField4Ex)
			$_r_Sum:=$_r_Sum+vAmount
			If (<>SYS_l_CancelProcess#$_l_CurrentProcess)
				If (vAmount>$_r_Max)
					$_r_Max:=vAmount
				End if 
				If (vAmount<$_r_Min)
					$_r_Min:=vAmount
				End if 
			End if 
			NEXT RECORD:C51($_ptr_Table->)
		End while 
		ON ERR CALL:C155("Error_Proc")
	End if 
	Case of 
		: (SV_at_CalcOption4=1)
			aSV4{$1}:=Gen_Round($_r_Sum; 2; 2)
			vSVT4:=vSVT4+aSV4{$1}
		: (SV_at_CalcOption4=2)
			If (aSV2{$1}=0)
				aSV4{$1}:=0
			Else 
				aSV4{$1}:=Gen_Round(($_r_Sum/aSV2{$1}); 2; 2)
			End if 
			vSVT4:=vSVT4+$_r_Sum
		: (SV_at_CalcOption4=3)
			aSV4{$1}:=$_r_Max
			vSVT4:=vSVT4+aSV4{$1}
		: (SV_at_CalcOption4=4)
			aSV4{$1}:=$_r_Min
			vSVT4:=vSVT4+aSV4{$1}
	End case 
Else 
	If (SV_at_FieldName4{SV_at_FieldName4}="FF:@")
		StatsView_Upd4F($1)
	Else 
		$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{DB_at_TableName})
		$_l_FieldRow:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TablePosition}; SV_at_FieldName4{SV_at_FieldName4})  //Find the Field No from the interProcess_Arrays
		If ($_l_FieldRow>0)
			
			$_ptr_Field4:=Field:C253(SV_al_TableNumber{DB_at_TableName}; $_l_FieldRow)
			Case of 
				: (SV_at_CalcOption4=1)
					$_r_Sum:=Sum_FieldArr($_ptr_Field4)
					// $_r_Sum:=Sum($_ptr_Field4»)
					aSV4{$1}:=Gen_Round($_r_Sum; 2; 2)
					vSVT4:=vSVT4+aSV4{$1}
				: (SV_at_CalcOption4=2)
					$_r_Sum:=Sum_FieldArr($_ptr_Field4)
					//  $_r_Sum:=Sum($_ptr_Field4»)
					If (aSV2{$1}=0)
						aSV4{$1}:=0
					Else 
						aSV4{$1}:=Gen_Round(($_r_Sum/aSV2{$1}); 2; 2)
					End if 
					vSVT4:=vSVT4+$_r_Sum
				: (SV_at_CalcOption4=3)
					aSV4{$1}:=Max:C3($_ptr_Field4->)
					vSVT4:=vSVT4+aSV4{$1}
				: (SV_at_CalcOption4=4)
					aSV4{$1}:=Min:C4($_ptr_Field4->)
					vSVT4:=vSVT4+aSV4{$1}
			End case 
		End if 
		
	End if 
End if 
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
ERR_MethodTrackerReturn("StatsView Upd4"; $_t_oldMethodName)
