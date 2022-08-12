//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonGr_InLPNo
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
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_CodeUsage; 0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_CodeUsage; 0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305(<>StatesLoaded; vMod2)
	C_LONGINT:C283($_l_ArraySize; $_l_Index; $_l_RecordCount; $_l_StateRow; $_l_TableNumber; $1; VNo2; vNo3)
	C_TEXT:C284($_t_oldMethodName; $_t_State; $_t_TableCode; $_t_TableNumberString; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InLPNo")
//PersonGr_InLPNo - the bit that loads in the States
//$1 is the element in the array
If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
Else 
	$_l_TableNumber:=VNo2
End if 

If (vMod2)
	PersonGr_InLPA2
End if 

If ((vNo2>0) & (vNo2<Size of array:C274(<>DB_at_TableNames)))
	vStatus:=<>DB_at_TableNames{$_l_TableNumber}
	
	$_l_ArraySize:=Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})
	If ($_l_ArraySize>0)  //If States are defined by States Load
		ARRAY TEXT:C222(CU_at_CodeUse; $_l_ArraySize)
		ARRAY TEXT:C222(SVS_at_PreviewTypeN; $_l_ArraySize)
		ARRAY INTEGER:C220(CU_ai_CodeUsed; $_l_ArraySize)
		ARRAY INTEGER:C220(CU_ai_CodeNo; $_l_ArraySize)
		ARRAY REAL:C219(GEN_ar_Value; $_l_ArraySize)
		For ($_l_Index; 1; $_l_ArraySize)
			CU_at_CodeUse{$_l_Index}:=<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_Index}
			SVS_at_PreviewTypeN{$_l_Index}:=<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_Index}
			CU_ai_CodeUsed{$_l_Index}:=0
			CU_abo_CodeUsed{$_l_Index}:=False:C215
			CU_ai_CodeNo{$_l_Index}:=0
			GEN_ar_Value{$_l_Index}:=0
		End for 
		
		$_t_TableNumberString:=String:C10(<>DB_al_TableNums{$_l_TableNumber})
		$_t_TableCode:="092"+[PERSONNEL_GROUPS:92]Group_Code:1+(" "*(5-Length:C16([PERSONNEL_GROUPS:92]Group_Code:1)))
		$_t_TableCode:=$_t_TableCode+("0"*(3-Length:C16($_t_TableNumberString)))+$_t_TableNumberString+"@"
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_TableCode)  //Find Code uses with a prefix of this Group
		$_l_RecordCount:=Records in selection:C76([CODE_USES:91])
		If ($_l_RecordCount=0)
			For ($_l_Index; 1; $_l_ArraySize)
				CU_ai_CodeUsed{$_l_Index}:=1
				CU_abo_CodeUsed{$_l_Index}:=True:C214
			End for 
		Else 
			ARRAY TEXT:C222($_at_CodeUsage; 0)
			ARRAY INTEGER:C220($_ai_CodeUsage; 0)
			SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_CodeUsage; [CODE_USES:91]Use:2; $_ai_CodeUsage)
			For ($_l_Index; 1; $_l_RecordCount)  //Compare the 2 sets of arrays
				$_t_State:=Substring:C12($_at_CodeUsage{$_l_Index}; 12; 3)
				$_l_StateRow:=Find in array:C230(CU_at_CodeUse; $_t_State)
				If ($_l_StateRow>0)
					CU_abo_CodeUsed{$_l_Index}:=(($_ai_CodeUsage{$_l_Index}%2)=1)
					//CU_ai_CodeUsed{$_l_StateRow}:=($_ai_CodeUsage{$_l_Index}%2)
					CU_ai_CodeNo{$_l_StateRow}:=(($_ai_CodeUsage{$_l_Index}\2)%2)
					GEN_ar_Value{$_l_StateRow}:=(($_ai_CodeUsage{$_l_Index}\4)%2)
				End if 
			End for 
		End if 
		
	Else 
		vStatus:=vStatus+": No States Defined"
		ARRAY TEXT:C222(CU_at_CodeUse; 0)
		ARRAY TEXT:C222(SVS_at_PreviewTypeN; 0)
		ARRAY INTEGER:C220(CU_ai_CodeUsed; 0)
		ARRAY BOOLEAN:C223(CU_abo_CodeUsed; 0)
		ARRAY INTEGER:C220(CU_ai_CodeNo; 0)
		ARRAY REAL:C219(GEN_ar_Value; 0)
	End if 
Else 
	vStatus:=""
	ARRAY TEXT:C222(CU_at_CodeUse; 0)
	ARRAY TEXT:C222(SVS_at_PreviewTypeN; 0)
	ARRAY INTEGER:C220(CU_ai_CodeUsed; 0)
	ARRAY BOOLEAN:C223(CU_abo_CodeUsed; 0)
	
	ARRAY INTEGER:C220(CU_ai_CodeNo; 0)
	ARRAY REAL:C219(GEN_ar_Value; 0)
End if 
PersonGr_InArrC
vMod2:=False:C215
vNo3:=vNo2
ERR_MethodTrackerReturn("PersonGr_InLPNo"; $_t_oldMethodName)
