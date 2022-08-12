If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oAccountHeadings1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/08/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_ACCHHeadings1;0)
	//ARRAY TEXT(DB_at_ACCHHeadings2;0)
	//ARRAY TEXT(DB_at_ACCHHeadings3;0)
	//ARRAY TEXT(DB_at_ACCHHeadings4;0)
	//ARRAY TEXT(DB_at_ACCHHeadings5;0)
	//ARRAY TEXT(DB_at_AccountCodes;0)
	//ARRAY TEXT(DB_At_headingNames;0)
	//ARRAY TEXT(DB_at_HeadingNames1;0)
	//ARRAY TEXT(DB_at_HeadingNames2;0)
	//ARRAY TEXT(DB_at_HeadingNames3;0)
	//ARRAY TEXT(DB_at_HeadingNames4;0)
	//ARRAY TEXT(DB_at_Headings;0)
	//ARRAY TEXT(DB_At_SubHeadingLevel;0)
	C_BOOLEAN:C305($_bo_AddSubHeadings; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_POINTER:C301($_Ptr_ArrayPointer)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here













$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oAccountHeadings1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		
		LISTBOX GET CELL POSITION:C971(*; "oAccountHeadings1"; $_l_Column; $_l_Row)
		If ($_l_Column>0)
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			
			
			LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			$_Ptr_ArrayPointer:=$_aptr_ColumnVariables{$_l_Column}  //There can easily be 61 columns
			//: ($_l_Column=1)  //SubHeading Level(DB_at_SubHeadlingLevel)
			//($_l_Column=2)  // Heading Code(DB_at_Headings)
			//($_l_Column=3)  //`Heading name(DB_at_HeadingNames)
			//: ($_l_Column=7)  //`Row Level(DB_ai_RowLevel)<--not displayed
			//: ($_l_Column=8)  //`Row Level(DB_at_AccHHeadings1)<-not displayed
			//: ($_l_Column=9)  //`Row Level(DB_al_HeadingLevel1)<-not displays
			//: ($_l_Column=10)  //`Row Level(DB_at_HeadingNames1)<-not displays
			//: ($_l_Column=11)  //`Row Level(DB_at_HeadingAccCodeFrom1)<-not displays
			//: ($_l_Column=12)  //`Row Level(DB_at_HeadingAccCodeto1)<-not displays
			//: ($_l_Column=13)  //`Row Level(DB_at_HeadingAccCodeto1)<-not displays
			//: ($_l_Column=14)  //`Row Level(DB_at_HeadingGroup1)<-not displayed
			//: ($_l_Column=15)  //`Row Level(DB_at_HeadingLevelUp1)<-not displayed
			
			
			
			
			
			//: ($_l_Column=16)  //`Row Level(DB_at_ACCHHeadings2)<-not displayed
			//: ($_l_Column=17)  //`Row Level(DB_al_HeadingLevel2)<-not displays
			//: ($_l_Column=18)  //`Row Level(DB_at_HeadingNames2)<-not displays
			//: ($_l_Column=19)  //`Row Level(DB_at_HeadingAccCodeFrom2)<-not displays
			//: ($_l_Column=20)  //`Row Level(DB_at_HeadingAccCodeto2)<-not displays
			//: ($_l_Column=21)  //`Row Level(DB_at_HeadingAccCodeto2)<-not displays
			//: ($_l_Column=22)  //`Row Level(DB_at_HeadingGroup2)<-not displayed
			//: ($_l_Column=23)  //`Row Level(DB_at_HeadingLevelUp2)<-not displayed
			
			//: ($_l_Column=24)  //`Row Level(DB_at_ACCHHeadings3)<-not displayed
			//: ($_l_Column=25)  //`Row Level(DB_al_HeadingLevel3)<-not displays
			//: ($_l_Column=26)  //`Row Level(DB_at_HeadingNames3)<-not displays
			//: ($_l_Column=27)  //`Row Level(DB_at_HeadingAccCodeFrom3)<-not displays
			//: ($_l_Column=28)  //`Row Level(DB_at_HeadingAccCodeto3)<-not displays
			//: ($_l_Column=29)  //`Row Level(DB_at_HeadingAccCodeto3)<-not displays
			//: ($_l_Column=30)  //`Row Level(DB_at_HeadingGroup3)<-not displayed
			//: ($_l_Column=31)  //`Row Level(DB_at_HeadingLevelUp3)<-not displayed
			
			//: ($_l_Column=32)  //`Row Level(DB_at_ACCHHeadings4)<-not displayed
			//: ($_l_Column=33)  //`Row Level(DB_al_HeadingLevel4)<-not displays
			//: ($_l_Column=34)  //`Row Level(DB_at_HeadingNames4)<-not displays
			//: ($_l_Column=35)  //`Row Level(DB_at_HeadingAccCodeFrom4)<-not displays
			//: ($_l_Column=36)  //`Row Level(DB_at_HeadingAccCodeto4)<-not displays
			//: ($_l_Column=37)  //`Row Level(DB_at_HeadingAccCodeto4)<-not displays
			//: ($_l_Column=38)  //`Row Level(DB_at_HeadingGroup4)<-not displayed
			//: ($_l_Column=39)  //`Row Level(DB_at_HeadingLevelUp4)<-not displayed
			
			
			
			Case of 
					
					
				: ($_l_Column=2)  // Heading Code(DB_at_Headings)
					
					
					
					
					
					
					If (DB_at_Headings{$_l_Row}="") & (DB_at_AccountCodes{$_l_Row}="")
						LB_SetEnterable(->ACC_lb_Headings; True:C214; 2)
						
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						
						EDIT ITEM:C870(*; $_at_ColumnNames{2}; $_l_Row)
						
						
					End if 
				: ($_l_Column=3)  //`Heading name(DB_at_HeadingNames)
					
					
					
					If (DB_at_Headings{$_l_Row}#"") & (DB_At_headingNames{$_l_Row}="") & (DB_at_AccountCodes{$_l_Row}="")
						LB_SetEnterable(->ACC_lb_Headings; True:C214; 3)
						
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						
						EDIT ITEM:C870(*; $_at_ColumnNames{3}; $_l_Row)
						
						
					End if 
				: ($_l_Column=4)  //Heading account Range-not directly editable-build from the sub headings
					
					
				: ($_l_Column=5)  //`Add sub heading(DB_API_AddSubHeading)
					
				: ($_l_Column=6)  //`Add new account DB_API_AddAccount)
					
				: ($_l_Column=7)  //`Row Level(DB_ai_RowLevel)
				: ($_l_Column=8)  //`Row Level(DB_at_AccHHeadings1)
				: ($_l_Column=9)  //`Row Level(DB_at_AccHeaingNames1)
					
					
					
				Else 
					ACC_SetupManagerRow($_l_Row; $_Ptr_ArrayPointer; On Clicked:K2:4)
			End case 
		End if 
		
	: ($_l_event=On Row Moved:K2:32)
		
		
		
	: ($_l_event=On Drop:K2:12)  //handle primarily moving rows
		
		
		
	: ($_l_event=On After Keystroke:K2:26) | ($_l_event=On After Edit:K2:43)
		
		
		LISTBOX GET CELL POSITION:C971(*; "oAccountHeadings1"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				Case of 
					: (DB_At_SubHeadingLevel{$_l_Row}="")
						DB_at_HeadingNames1{$_l_Row}:=DB_at_Headings{$_l_Row}
						
					: (DB_At_SubHeadingLevel{$_l_Row}="@one@")
						DB_at_HeadingNames1{$_l_Row}:=DB_at_Headings{$_l_Row}
						
					: (DB_At_SubHeadingLevel{$_l_Row}="@two@")
						DB_at_HeadingNames1{$_l_Row}:=DB_at_Headings{$_l_Row}
						
					: (DB_At_SubHeadingLevel{$_l_Row}="@three@")
						DB_at_HeadingNames1{$_l_Row}:=DB_at_Headings{$_l_Row}
						
					: (DB_At_SubHeadingLevel{$_l_Row}="@four@")
						DB_at_HeadingNames1{$_l_Row}:=DB_at_Headings{$_l_Row}
						
					: (DB_at_AccountCodes{$_l_Row}#"")
						DB_at_HeadingNames1{$_l_Row}:=""
						
						
				End case 
				
			: ($_l_Column=3)
				
				
		End case 
	: ($_l_event=On Data Change:K2:15)
		
		
		LISTBOX GET CELL POSITION:C971(*; "oAccountHeadings1"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)  //SubHeading Level
			: ($_l_Column=2)  // Heading Code
				
				
				
				
				$_bo_OK:=False:C215
				Case of 
					: (DB_At_SubHeadingLevel{$_l_Row}="")
						DB_at_ACCHHeadings1{$_l_Row}:=DB_at_Headings{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@one@")
						DB_at_ACCHHeadings2{$_l_Row}:=DB_at_Headings{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@two@")
						DB_at_ACCHHeadings3{$_l_Row}:=DB_at_Headings{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@three@")
						DB_at_ACCHHeadings4{$_l_Row}:=DB_at_Headings{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@four@")
						DB_at_ACCHHeadings5{$_l_Row}:=DB_at_Headings{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_at_AccountCodes{$_l_Row}#"")
						DB_at_Headings{$_l_Row}:=""
						
						
				End case 
				If ($_bo_OK)
					LB_SetEnterable(->ACC_lb_Headings; False:C215; 2)
					LB_SetEnterable(->ACC_lb_Headings; True:C214; 3)
					LISTBOX SELECT ROW:C912(*; "oAccountHeadings1"; 0)
					ARRAY TEXT:C222($_at_ColumnNames; 0)
					ARRAY TEXT:C222($_at_HeaderNames; 0)
					ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
					ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
					ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
					ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
					Gen_Alert("Please give this Heading a Name")
					LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
					EDIT ITEM:C870(*; $_at_ColumnNames{3}; $_l_Row)
					
				End if 
			: ($_l_Column=3)  // Heading Name
				
				
				$_bo_OK:=False:C215
				$_bo_AddSubHeadings:=True:C214
				Case of 
					: (DB_At_SubHeadingLevel{$_l_Row}="")
						DB_at_HeadingNames1{$_l_Row}:=DB_At_headingNames{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@one@")
						DB_at_HeadingNames2{$_l_Row}:=DB_At_headingNames{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@two@")
						DB_at_HeadingNames3{$_l_Row}:=DB_At_headingNames{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@three@")
						DB_at_HeadingNames4{$_l_Row}:=DB_At_headingNames{$_l_Row}
						$_bo_OK:=True:C214
					: (DB_At_SubHeadingLevel{$_l_Row}="@four@")
						DB_at_HeadingNames4{$_l_Row}:=DB_At_headingNames{$_l_Row}
						$_bo_OK:=True:C214
						$_bo_AddSubHeadings:=False:C215
						
					: (DB_at_AccountCodes{$_l_Row}#"")
						DB_At_headingNames{$_l_Row}:=""
						
						
				End case 
				If ($_bo_OK)
					
					If ($_bo_AddSubHeadings)
						Gen_Alert("You may now add sub headings or accounts to this heading")
						
					Else 
						Gen_Alert("You may now add accounts to this heading")
					End if 
					LB_SetEnterable(->ACC_lb_Headings; False:C215; 3)
					LB_SetEnterable(->ACC_lb_Headings; True:C214; 5)
					LB_SetEnterable(->ACC_lb_Headings; True:C214; 6)
					
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oAccountHeadings1"; $_t_oldMethodName)
