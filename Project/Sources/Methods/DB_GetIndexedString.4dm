//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetIndexedString
	//------------------ Method Notes ------------------
	//This method is a wrapper for get indexed string.
	//the object is to provide access to the former resources and at the same time provide a path to move to xliff so we can extend all the labelling to use contextual values
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_MenuITemName; $_t_oldMethodName; $0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetIndexedString")
$0:=""
Case of 
	: (Count parameters:C259=2)  //lookup in a table of former str reSources_Internally if $1>0)
		Case of 
			: ($1>0)
				Case of 
					: ($1=20000)
						$_t_MenuITemName:=""
						Case of 
							: ($2=1)  //About_Daybook
								$_t_MenuITemName:="About_Daybook"
							: ($2=2)  //PROCESSES
								$_t_MenuITemName:="Processes"
								
							: ($2=3)  // CHANGE ACCESS
								$_t_MenuITemName:="Change Access"
							: ($2=4)  // FLUSH BUFFERS
								$_t_MenuITemName:="Flush Buffers"
								
							: ($2=5)  // MULTI PROCESSES
								$_t_MenuITemName:="Multi Processes"
							: ($2=6)  // `14" SCREENS
								$_t_MenuITemName:="14 Screens"
							: ($2=7)  // ENTRY DEFAULTS
								$_t_MenuITemName:=Get localized string:C991("MenuItem_Entrydefaults")
							: ($2=8)  //`FIND DEFAULTS
								$_t_MenuITemName:=Get localized string:C991("MenuItem_Finddefaults")
								
							: ($2=5)  // MULTI PROCESSES
								$_t_MenuITemName:="Multi Processes"
							: ($2=9)  // FIND USER DATA
								$_t_MenuITemName:=Get localized string:C991("MenuItem_Finduserdata")
								
							: ($2=10)  //BATCH ENTRY
								$_t_MenuITemName:=Get localized string:C991("MenuItem_BatchEntry")
							: ($2=11)  // QUICK ACCESS
								$_t_MenuITemName:="Multi Processes"
							: ($2=12)  //STATISTICS VIEW
								$_t_MenuITemName:=Get localized string:C991("MenuItem_Statisticsview")
								
							: ($2=13)  //QUIT TO USER
								$_t_MenuITemName:=Get localized string:C991("MenuItem_Quittouser")
								
							: ($2=20)  //volumes
								$_t_MenuITemName:=Get localized string:C991("Menu_Volumes")
							: ($2=21)  //Diary Manager
								$_t_MenuITemName:="Time Manager"
							: ($2=22)  //Campaign Manager
								$_t_MenuITemName:="Campain Manager"
							: ($2=23)  //Sales Manager
								$_t_MenuITemName:="Sales Manager"
							: ($2=24)  //WP
								$_t_MenuITemName:=Get localized string:C991("MenuItem_DocumentManager")
								
							: ($2=25)  //`stock
								$_t_MenuITemName:="Stock Manager"
							: ($2=26)  //Sales orders
								$_t_MenuITemName:="Sales Orders"
							: ($2=27)  //Sales orders
								$_t_MenuITemName:="Purchase Orders"
							: ($2=28)  //sales ledger
								$_t_MenuITemName:="Sales Ledger"
							: ($2=29)  //`nominal ledger
								$_t_MenuITemName:="Purchase Ledger"
							: ($2=30)  //Sales Manager
								$_t_MenuITemName:="Nominal Ledger"
							: ($2=31)  //service centre
								$_t_MenuITemName:="Service Centre"
							: ($2=32)  //JOB COSTING
								$_t_MenuITemName:="Job Costing"
							: ($2=33)  //AGENCY MANAGER
								$_t_MenuITemName:="Agency Manager"
							: ($2=34)  //MODELS MANAGER
								$_t_MenuITemName:="Models Manager"
							: ($2=35)  //EVENTS Manager
								$_t_MenuITemName:="Events Manager"
							: ($2=36)  //NOTHING
							: ($2=37)  //COMMUNICATIONS
								$_t_MenuITemName:="Web Access"
							: ($2=38)  //
							: ($2=39)  //FUNCTIONS PALLETTE
								$_t_MenuITemName:=Get localized string:C991("MenuItem_FunctionsPalette")
							: ($2=40)  //`VOLUMES PALLETTE
								$_t_MenuITemName:=Get localized string:C991("MenuItem_VolumesPalette")
							: ($2=41)  //MACROS PALLETTE
								$_t_MenuITemName:=Get localized string:C991("MenuItem_MacrosPalette")
							: ($2=42)  //MODULES PALLETTER
								$_t_MenuITemName:="Volumes Palette"
							: ($2=43)  //PROCESS PALLETTE
								$_t_MenuITemName:="Processes Palette"
							: ($2=44)  //
							: ($2=45)  //
							: ($2=46)  //NOTHING
							: ($2=47)  //
							: ($2=48)  //D
							: ($2=49)  //
							: ($2=70)  //` products
								$_t_MenuITemName:=Get localized string:C991("Menu_Products")
								
							: ($2=71)  //`enter products
								$_t_MenuITemName:="Enter Products"
							: ($2=72)  //VIEW PRoducts
								$_t_MenuITemName:="VIew Products"
							: ($2=73)  //ENTER TO PRICE TABLE
								$_t_MenuITemName:=Get localized string:C991("MenuItem_EnterPricetable")
							: ($2=74)  //VIEW PRICE TABLE
								$_t_MenuITemName:=Get localized string:C991("MenuItem_ViewPricetable")
								
							: ($2=75)  //list products
								$_t_MenuITemName:="List Products"
							: ($2=76)  //price list
								$_t_MenuITemName:="Price list"
							: ($2=77)  //import products
								$_t_MenuITemName:="Import Products"
							: ($2=78)  //
							: ($2=79)  //
							: ($2=90)  //`
							: ($2=90)  //` DIARY
								$_t_MenuITemName:="Diary"
							: ($2=91)  //`enter to diary
								$_t_MenuITemName:="Enter to Diary"
								
							: ($2=92)  //VIEW diary
								$_t_MenuITemName:="View  Diary"
							: ($2=93)  //Priorirty 1
								$_t_MenuITemName:="Priority 1"
							: ($2=94)  //done
								$_t_MenuITemName:="Done "
							: ($2=95)  //all
								$_t_MenuITemName:="All"
							: ($2=96)  //
							: ($2=97)  //
							: ($2=98)  //
							: ($2=99)  //
							: ($2=111)
								
								$_t_MenuITemName:=Get localized string:C991("MenuItem_EnterEnquiry")
							: ($2=112)  //
								$_t_MenuITemName:=Get localized string:C991("MenuItem_EnterQuotation")
								
							: ($2=113)  //
								$_t_MenuITemName:=Get localized string:C991("MenuItem_EnterNewOrder")
								
						End case 
						If ($_t_MenuITemName="")
							
							$_t_MenuITemName:=Get indexed string:C510($1; $2)
							
						End if 
						$0:=$_t_MenuITemName
					Else 
						$0:=Get indexed string:C510($1; $2)
						
				End case 
			: ($1=0) & ($2=0)
				
			Else 
				
		End case 
	: (Count parameters:C259=3)
		$0:=$3  //default no translation
		
		//Translate the string in $2
	: (Count parameters:C259=4)
		//translate the string in $2 using language in $4
End case 
ERR_MethodTrackerReturn("DB_GetIndexedString"; $_t_oldMethodName)