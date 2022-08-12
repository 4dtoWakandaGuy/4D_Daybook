//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_NewsApplyTokens
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2010 10:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_TokenFields;0)
	//ARRAY TEXT(CO_at_TokenOptions;0)
	C_LONGINT:C283($_l_CurrentSelectedRecord; $_l_Index; $_l_RecordsinSelection; $_l_ScriptMarkerPosition; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_ConstructURL; $_t_FieldValue; $_t_oldMethodName; $_t_PreScriptText; $_t_ScriptCode; $_t_ScriptResult; $_t_ScriptText; $_t_TokenOption; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_NewsApplyTokens")

//This method will parse the text passed in $1 replacing any tokens with field values
//First load the tokens

If (Count parameters:C259>=1)
	$_t_ConstructURL:=$1
	If (Count parameters:C259>=2)
		$_l_TableNumber:=$2
	Else 
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	End if 
	CO_LoadWebSearchtokens(True:C214; $_l_TableNumber)
	
	For ($_l_Index; 1; Size of array:C274(CO_al_TokenFields))
		$_t_TokenOption:="<"+CO_at_TokenOptions{$_l_Index}+">"
		$_l_ScriptMarkerPosition:=Position:C15($_t_TokenOption; $_t_ConstructURL)
		If ($_l_ScriptMarkerPosition>0)
			//$_l_TableNumber:=Table(->[COMPANIES])
			Case of 
				: (CO_al_TokenFields{$_l_Index}=-1) & ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					
					QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
					ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; >)
					If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
						$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
						$_l_CurrentSelectedRecord:=1
						Repeat 
							If ($_l_CurrentSelectedRecord<$_l_RecordsinSelection)
								If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
									NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
									$_l_CurrentSelectedRecord:=$_l_CurrentSelectedRecord+1
								End if 
							End if 
						Until ($_l_CurrentSelectedRecord=$_l_RecordsinSelection) | ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
						If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
							ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; >)
						End if 
					End if 
					//supplier company website
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PRODUCTS_SUPPLIERS:148]Company_Code:1)
					$_ptr_Field:=->[COMPANIES:2]Home_Page_URL:56
				: (CO_al_TokenFields{$_l_Index}=-2) & ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					//supplier  product code
					QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
					ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; >)
					If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
						$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
						$_l_CurrentSelectedRecord:=1
						Repeat 
							If ($_l_CurrentSelectedRecord<$_l_RecordsinSelection)
								If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
									NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
									$_l_CurrentSelectedRecord:=$_l_CurrentSelectedRecord+1
								End if 
							End if 
						Until ($_l_CurrentSelectedRecord=$_l_RecordsinSelection) | ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
						If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
							ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; >)
						End if 
					End if 
					
					$_ptr_Field:=->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4
				Else 
					
					$_ptr_Field:=Field:C253($_l_TableNumber; CO_al_TokenFields{$_l_Index})
			End case 
			Case of 
				: (CO_al_TokenFields{$_l_Index}=Field:C253(->[COMPANIES:2]Invoice_Postcode:22)) | (CO_al_TokenFields{$_l_Index}=Field:C253(->[COMPANIES:2]Postal_Code:7))
					$_t_FieldValue:=$_ptr_Field->
					$_t_FieldValue:=Replace string:C233($_t_FieldValue; " "; "+")
				: (Type:C295($_ptr_Field->)=Is longint:K8:6) | (Type:C295($_ptr_Field->)=Is integer:K8:5) | (Type:C295($_ptr_Field->)=Is real:K8:4)
					$_t_FieldValue:=String:C10($_ptr_Field->)
					$_t_FieldValue:=Replace string:C233($_t_FieldValue; " "; "+")
				: (Type:C295($_ptr_Field->)=Is date:K8:7)
					$_t_FieldValue:=String:C10($_ptr_Field->)
					$_t_FieldValue:=Replace string:C233($_t_FieldValue; " "; "+")
				: (Type:C295($_ptr_Field->)=Is time:K8:8)
					$_t_FieldValue:=Time string:C180($_ptr_Field->*1)
					$_t_FieldValue:=Replace string:C233($_t_FieldValue; " "; "+")
				Else 
					$_t_FieldValue:=$_ptr_Field->
					$_t_FieldValue:=Replace string:C233($_t_FieldValue; " "; "+")
			End case 
			$_t_ConstructURL:=Replace string:C233($_t_ConstructURL; $_t_TokenOption; $_t_FieldValue)
		End if 
	End for 
	$_l_ScriptMarkerPosition:=Position:C15("MACRO"; $_t_ConstructURL)
	If ($_l_ScriptMarkerPosition>0)
		$_t_ConstructURL:=Substring:C12($_t_ConstructURL; 1; $_l_ScriptMarkerPosition-1)
		$_t_ScriptText:=Substring:C12($_t_ConstructURL; $_l_ScriptMarkerPosition)
		$_l_ScriptMarkerPosition:=Position:C15("(|"; $_t_ScriptText)
		If ($_l_ScriptMarkerPosition>0)  //it should be
			$_t_PreScriptText:=Substring:C12($_t_ScriptText; 1; $_l_ScriptMarkerPosition-1)
			$_t_ScriptText:=Substring:C12($_t_ScriptText; $_l_ScriptMarkerPosition+1)
			$_l_ScriptMarkerPosition:=Position:C15(")"; $_t_ScriptText)
			If ($_l_ScriptMarkerPosition>0)
				$_t_ScriptCode:=Substring:C12($_t_ScriptText; 1; $_l_ScriptMarkerPosition-1)
				$_t_ScriptText:=Substring:C12($_t_ScriptText; $_l_ScriptMarkerPosition+1)
			Else 
				$_t_ConstructURL:=$_t_ConstructURL+$_t_PreScriptText+$_t_ScriptText
			End if 
			$_t_ScriptResult:=Macro_ResultTxt($_t_ScriptCode)
			$_t_ConstructURL:=$_t_ConstructURL+$_t_ScriptResult+$_t_ScriptText
		Else 
			$_t_ConstructURL:=$_t_ConstructURL+$_t_ScriptText
		End if 
		//$_l_TableNumber:=Table(->[COMPANIES])
		
	End if 
	
	$0:=$_t_ConstructURL
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("CO_NewsApplyTokens"; $_t_oldMethodName)