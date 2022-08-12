//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_SmartQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 22:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Criteria)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1; VArea; VComments; VcompCode; VCompName; VCountry; VCounty; VDiscountF_TEXT; VDiscountT_TEXT)
	C_TEXT:C284(VeDateF_TEXT; VeDateT_TEXT; VFDateF_TEXT; VFDateT_TEXT; VOmit; VPostcode; VProdCode; Vrstate; Vsales; VsDateF_TEXT; VsDateT_TEXT)
	C_TEXT:C284(VSource; VStatus; VSuperior; Vtel; VTown; VType; VValueF_TEXT; VValueT_TEXT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_SmartQuery")

If (Count parameters:C259>=1)
	$_t_TableName:=DBWS_ContexttoTable($1)
	
	Case of 
		: ($_t_TableName="Companies")
			//`````````
			$_bo_Criteria:=False:C215
			VcompCode:=DBWS_GetInputValue("Code")
			VCompName:=DBWS_GetInputValue("Name")
			VSuperior:=DBWS_GetInputValue("Superior")
			VTown:=DBWS_GetInputValue("Town")
			VCounty:=DBWS_GetInputValue("County")
			If (VCounty="")
				VCounty:=DBWS_GetInputValue("State")
			End if 
			VPostcode:=DBWS_GetInputValue("Postcode")
			If (VPostcode="")
				VPostcode:=DBWS_GetInputValue("Zip")
			End if 
			Vtel:=DBWS_GetInputValue("Telephone")
			VCountry:=DBWS_GetInputValue("Country")
			VArea:=DBWS_GetInputValue("Area")
			VStatus:=DBWS_GetInputValue("Status")
			VType:=DBWS_GetInputValue("Type")
			VSource:=DBWS_GetInputValue("Source")
			Vsales:=DBWS_GetInputValue("SalesPerson")
			
			Vrstate:=DBWS_GetInputValue("RecordState")
			VDiscountF_TEXT:=DBWS_GetInputValue("SizeFrom")
			VDiscountT_TEXT:=DBWS_GetInputValue("SizeTo")
			If (VDiscountF_TEXT="") & (VDiscountT_TEXT="")
				VDiscountF_TEXT:=DBWS_GetInputValue("Size")
				VDiscountT_TEXT:=VDiscountF_TEXT
			End if 
			VValueF_TEXT:=DBWS_GetInputValue("ValueFrom")
			VValueT_TEXT:=DBWS_GetInputValue("ValueFrom")
			If (VValueF_TEXT="") & (VvalueT_TEXT="")
				VValueF_TEXT:=DBWS_GetInputValue("Value")
				VValueT_TEXT:=VValueF_TEXT
			End if 
			VeDateF_TEXT:=DBWS_GetInputValue("EntryDateFrom")
			VeDateT_TEXT:=DBWS_GetInputValue("EntryDateTo")
			If (VeDateF_TEXT="") & (VeDateT_TEXT="")
				VeDateF_TEXT:=DBWS_GetInputValue("EntryDate")
				VeDateT_TEXT:=VeDateF_TEXT
			End if 
			VsDateF_TEXT:=DBWS_GetInputValue("ModifiedDateFrom")
			VsDateT_TEXT:=DBWS_GetInputValue("ModifiedDateTo")
			If (VsDateF_TEXT="") & (VsDateT_TEXT="")
				VsDateF_TEXT:=DBWS_GetInputValue("ModifiedDate")
				VsDateT_TEXT:=VsDateF_TEXT
			End if 
			VFDateF_TEXT:=DBWS_GetInputValue("FinYearEndFrom")
			VFDateT_TEXT:=DBWS_GetInputValue("FinYearEndTo")
			If (VFDateF_TEXT="") & (VFDateT_TEXT="")
				VFDateF_TEXT:=DBWS_GetInputValue("FinYearEnd")
				VFDateT_TEXT:=VFDateF_TEXT
			End if 
			VOmit:=DBWS_GetInputValue("OmitfromMailings")
			VComments:=DBWS_GetInputValue("Comments")
			VProdCode:=DBWS_GetInputValue("Analysis")
			//Coerse the text into longints and dates
			//Here we pass that to the more choices search -skipping the window but not loading a queery
			
			//---------------- Load the data into arrays here. ----------------
			
			//SELECTION TO ARRAY([appartement]id;$_id;[appartement]type_pieces;$_pieces;[appartement]cp;$_cp;[appartement]ville;$_ville;[appartement]prix;$_prix)
			//$t:=""
			//For ($xx;1;1)
			//For ($i;1;Size of array($_pieces))
			//$pic:="<a href='#' onclick=' myZoom("+String($_id{$i})+"); return false;'><img src='/vignettes/"+String($_id{$i})+".jpg' /></a>"
			//$t:=$t+$pic+◊tab+$_pieces{$i}+◊tab+$_cp{$i}+◊tab+$_ville{$i}+◊tab+String($_prix{$i};"### ### ##0")+"\n"
			//End for
			//End for
			//SEND HTML TEXT($t)
			
			//``````
			
	End case 
End if 
ERR_MethodTrackerReturn("DBWS_SmartQuery"; $_t_oldMethodName)