If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.oProdComponentRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRD_at_ComponentField;0)
	C_BOOLEAN:C305(PC_bo_ComponentMod; PROD_bo_CompCheckReady; PROD_bo_ShowAlert)
	C_LONGINT:C283($_l_event; $_l_Retries; PROD_l_ComponentCheck; PROD_l_ComponentResult)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode; PRD_t_RelatedData; PRD_t_RelatedName; PROD_t_CurComponentsCode; PROD_t_ParentProductCode; PROD_t_ProductCode; PROD_t_ProductCodeTHis; PROD_t_RetProductCode; PROD_t_curComponentsNM; PROD_t_RetProductName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oProdComponentRelation"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		
		Case of 
			: (PRD_at_ComponentField=1)  // product
				//Look up the product...in a seperate process..return the product name if..if no product clear this field
				//``````````
				//NG MAY 2004. Note this script is very different to that used on the subform area
				//the subform area moved the current record pointer. This uses a seperate process for searching so
				//the record pointer does not move
				
				If (PROD_l_ComponentCheck=0)
					PROD_l_ComponentCheck:=New process:C317("Prod_ComponentChecker"; 128000; "Check_Product Components"; Current process:C322; [PRODUCTS:9]Product_Code:1)
					
				End if 
				Repeat 
					If (Not:C34(PROD_bo_CompCheckReady))
						DelayTicks(2)
					End if 
				Until (PROD_bo_CompCheckReady)
				PROD_l_ComponentResult:=0
				PROD_t_RetProductCode:=""
				PROD_t_RetProductName:=""
				$_l_Retries:=0
				While (Test semaphore:C652("$CompCheckerBusy"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				End while 
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ParentProductCode; [PRODUCTS:9]Product_Code:1)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_bo_ShowAlert; True:C214)
				PROD_t_ProductCodeTHis:=PRD_t_RelatedData
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ProductCode; PROD_t_ProductCodeTHis)
				RESUME PROCESS:C320(PROD_l_ComponentCheck)
				GET PROCESS VARIABLE:C371(PROD_l_ComponentCheck; PROD_t_ParentProductCode; $_t_ProductCode)
				$_l_Retries:=0
				While (Test semaphore:C652("$CompCheckerBusy")) | ($_t_ProductCode=[PRODUCTS:9]Product_Code:1)
					GET PROCESS VARIABLE:C371(PROD_l_ComponentCheck; PROD_t_ParentProductCode; $_t_ProductCode)
					
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
					
				End while 
				Case of 
					: (PROD_l_ComponentResult=1)
						PC_bo_ComponentMod:=True:C214
						//PROD_aS25_CurComponentsCode:=PROD_t_RetProductCode
						[COMPONENTS:86]Component_Code:2:=PROD_t_RetProductCode
						PRD_t_RelatedData:=PROD_t_RetProductCode
						PROD_t_RetProductCode:=PROD_t_CurComponentsCode
						PRD_t_RelatedName:=PROD_t_curComponentsNM
					: (PROD_l_ComponentResult=-2)
						PC_bo_ComponentMod:=True:C214
						[COMPONENTS:86]Component_Code:2:=""
						PROD_t_RetProductCode:=""
						PRD_t_RelatedName:=""
				End case 
				
				//``````````````
			: (PRD_at_ComponentField=2)  //catalogue
				//look up the product catalogue
				//look up the macro
				Check_MinorNC(->PRD_t_RelatedData; "Collection"; ->[CATALOGUE:108]; ->[CATALOGUE:108]Catalogue_Name:2; ->[CATALOGUE:108]Catalogue_Name:2; "Collection")
				If (PRD_t_RelatedData#"")
					If ([CATALOGUE:108]Catalogue_Name:2#PRD_t_RelatedData)
						QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]Catalogue_Name:2=PRD_t_RelatedData)
					End if 
					PC_bo_ComponentMod:=True:C214
					
					PRD_t_RelatedName:=[CATALOGUE:108]Catalogue_Name:2
					[COMPONENTS:86]Catalogue_ID:7:=[CATALOGUE:108]x_ID:1
					
				Else 
					PRD_t_RelatedName:=""
					[COMPONENTS:86]Catalogue_ID:7:=0
				End if 
			: (PRD_at_ComponentField=3)  // `script(macro)
				//look up the macro
				Check_MinorNC(->PRD_t_RelatedData; "Script"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Script")
				If (PRD_t_RelatedData#"")
					
					If ([SCRIPTS:80]Script_Code:1#PRD_t_RelatedData)
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=PRD_t_RelatedData)
					End if 
					PC_bo_ComponentMod:=True:C214
					
					[COMPONENTS:86]Macro_Rule:9:=[SCRIPTS:80]Script_Code:1
					PRD_t_RelatedName:=[SCRIPTS:80]Script_Name:2
					
				Else 
					[COMPONENTS:86]Macro_Rule:9:=""
					PRD_t_RelatedName:=""
				End if 
			: (PRD_at_ComponentField=4)  //  `product group
				//select the product group
				Check_Minor(->PRD_t_RelatedData; "Group"; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2; "Groups In")
				If (PRD_t_RelatedData#"")
					If ([PRODUCT_GROUPS:10]Group_Code:1#PRD_t_RelatedData)
						QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=PRD_t_RelatedData)
					End if 
					PC_bo_ComponentMod:=True:C214
					
					[COMPONENTS:86]Group_Code:8:=[PRODUCT_GROUPS:10]Group_Code:1
					PRD_t_RelatedName:=[PRODUCT_GROUPS:10]Group_Name:2
					
				Else 
					[COMPONENTS:86]Group_Code:8:=""
					PRD_t_RelatedName:=""
				End if 
			Else 
				Gen_Alert("Sorry you cannot set the related data before you select the type")
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oProdComponentRelation"; $_t_oldMethodName)
