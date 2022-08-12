If (False:C215)
	//Table Form Method Name: [COMPONENTS]Components_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 13:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ComponentRow; $_l_event)
	C_REAL:C285($_r_Quantity)
	C_TEXT:C284($_t_ComponentUniqueValue; $_t_oldMethodName; vProdCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPONENTS].Components_Sub"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([COMPONENTS:86]Component_Code:2))
				[COMPONENTS:86]Component_Code:2:=Uppercase:C13([COMPONENTS:86]Component_Code:2)
				If ([COMPONENTS:86]Component_Code:2#"")
					DB_SaveRecord(->[PRODUCTS:9])
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
					COPY NAMED SELECTION:C331([PRODUCTS:9]; "Products")
					Check_ProdSu([COMPONENTS:86]Component_Code:2)
					WS_KeepFocus  //ensures cursor stays in the window
					
					USE NAMED SELECTION:C332("Products")
					CLEAR NAMED SELECTION:C333("Products")
					[COMPONENTS:86]Component_Code:2:=vProdCode
				End if 
				DB_SaveRecord(->[COMPONENTS:86])
				
				$_t_ComponentUniqueValue:=[COMPONENTS:86]UniqueValue:4
				$_l_ComponentRow:=Find in array:C230(PROD_at_ComponentUnique; $_t_ComponentUniqueValue)
				//this is to stop you adding the same component twice!
				If ($_l_ComponentRow>0)
					//this component already exists!
					$_r_Quantity:=0
					CONFIRM:C162("You cannot add the same component twice. Increase quantity?"; "NO"; "YES")
					If (OK=0)
						//we want to increase the quanity!
						$_r_Quantity:=[COMPONENTS:86]Quantity:3
					End if 
					DB_DeletionControl(->[COMPONENTS:86])
					
					DELETE RECORD:C58([COMPONENTS:86])
					If ($_r_Quantity>0)
						QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]UniqueValue:4=$_t_ComponentUniqueValue)
						[COMPONENTS:86]Quantity:3:=[COMPONENTS:86]Quantity:3+$_r_Quantity
					End if 
					QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
					SELECTION TO ARRAY:C260([COMPONENTS:86]UniqueValue:4; PROD_at_ComponentUnique)
				End if 
				
			: (Modified:C32([COMPONENTS:86]Quantity:3))
				
		End case 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPONENTS:86]); "Components_Sub")
		If ([COMPONENTS:86]Product_Code:1="")
			[COMPONENTS:86]Product_Code:1:=[PRODUCTS:9]Product_Code:1
			[COMPONENTS:86]Quantity:3:=1
		End if 
End case 
ERR_MethodTrackerReturn("FM:Components_Sub"; $_t_oldMethodName)
