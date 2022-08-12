//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:           08/05/2010 13:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Mod_aBo_AtStartup;0)
	//ARRAY BOOLEAN(<>Mod_abo_HasIcon;0)
	ARRAY INTEGER:C220($_ai_AccessControlLevel; 0)
	ARRAY INTEGER:C220($_ai_STRres; 0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(<>Mod_al_ModuleOrder;0)
	//ARRAY LONGINT(<>Mod_al_STRres;0)
	ARRAY LONGINT:C221($_al_ModuleOrder; 0)
	//ARRAY TEXT(<>Mod_at_LocalisedModuleName;0)
	//ARRAY TEXT(<>Mod_at_ModuleColourName;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>MOD_bo_ModuleDataLoaded; $_bo_Resave)
	C_LONGINT:C283(<>MOD_l_Called; <>Mod_l_MaxModules; $_l_Change; $_l_Fill; $_l_ModuleArraysID; $_l_ModuleNumber; $_l_Offset; $_l_OffSetOld)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_Array")
//TRACE
<>Mod_l_MaxModules:=45
If (Is compiled mode:C492)
	
	If (<>MOD_l_Called=0)
		If (<>MOD_bo_ModuleDataLoaded)
			//ALERT("Something has already set data loaded to true")
		End if 
	Else 
		If (Size of array:C274(<>Mod_al_ModuleOrder)=0)
			//ALERT("Something has set the size of module order to zero")
		End if 
	End if 
	<>MOD_l_Called:=<>MOD_l_Called+1
End if 
While (Semaphore:C143("$ModifyingModulesArray"))
	DelayTicks(2)
	//ALERT("Waiting for semaphore")
	
End while 
If (<>MOD_bo_ModuleDataLoaded)
End if 
If (Not:C34(<>MOD_bo_ModuleDataLoaded)) | (Size of array:C274(<>Mod_al_ModuleOrder)=0) | (<>MOD_l_Called=1)
	If (<>MOD_l_Called=1)
		//MESSAGE("Loading modules ")
	End if 
	$_l_ModuleArraysID:=PREF_GetPreferenceID("Volume Arrays"; True:C214; -1)
	If (<>MOD_l_Called=1)
		//MESSAGE("Loading modules Pref id="+String($_l_ModuleArraysID))
	End if 
	If ([PREFERENCES:116]IDNumber:1#$_l_ModuleArraysID)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ModuleArraysID)
	End if 
	If (Records in selection:C76([PREFERENCES:116])=0)
		//ALERT("Loading modules from hard coding")
		
		//ALERT("ID="+String($_l_ModuleArraysID))
		
		ARRAY LONGINT:C221(<>Mod_al_ModuleOrder; <>Mod_l_MaxModules)
		ARRAY TEXT:C222(<>Mod_at_ModuleColourName; <>Mod_l_MaxModules)
		ARRAY LONGINT:C221(<>Mod_al_AccessControlLevel; <>Mod_l_MaxModules)
		//The above array declares at what level the access is controlled
		//0=Disabled..dont show this module anywhere in daybook
		//1=System. Module is either available to everyone or not..no control at group or personnel level
		//2=Group access is controlled at group level(module is displayed in personnel but cannt be disabled if enabled in group)
		//3=Group access is controlled at group level but can be overridden at personnel level--. By Default the group access is read only(to use the module not add data)
		//4=Group access is controlled at group level but can be overridden at personnel level--most are this where access is controlled. By Default the group access is read write
		//5personnel level module is not displayed for control in group only at personnel level--dont think we have any of these
		
		ARRAY BOOLEAN:C223(<>Mod_abo_HasIcon; <>Mod_l_MaxModules)
		
		ARRAY BOOLEAN:C223(<>Mod_aBo_AtStartup; <>Mod_l_MaxModules)
		//If the module has an OPTION to run some functions at startup set this to true..currently this is for the diary and the internet manager. by setting this value you can give some access to the internet manager without it starting up automatically
		ARRAY TEXT:C222(<>Mod_at_ModuleName; <>Mod_l_MaxModules)
		ARRAY TEXT:C222(<>Mod_at_ProcessFunction; <>Mod_l_MaxModules)
		ARRAY LONGINT:C221(<>Mod_al_STRres; <>Mod_l_MaxModules)
		ARRAY TEXT:C222(<>Mod_at_LocalisedModuleName; <>Mod_l_MaxModules)
		//this array holds the string resource number, used to
		//make sure the CORRECT menu item is ticked
		$_l_ModuleNumber:=1
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Daybook Silver"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:="Menu Silver"
		<>Mod_al_STRres{$_l_ModuleNumber}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{$_l_ModuleNumber}:=-2
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{1}:="Blue"
		
		$_l_ModuleNumber:=Module_DiaryManager
		
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Diary Manager"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{2}:="Menu_Main"
		<>Mod_al_STRres{2}:=21
		<>Mod_at_LocalisedModuleName{2}:="MenuItem_Timemanager"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=True:C214
		<>Mod_al_ModuleOrder{2}:=1
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{2}:="Blue"
		$_l_ModuleNumber:=Module_WPManager
		
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Word Processing"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{3}:="Menu_WP"
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{3}:=24
		<>Mod_at_LocalisedModuleName{3}:="MenuItem_DocumentManager"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_al_ModuleOrder{3}:=2  //4
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{3}:="Brown"
		$_l_ModuleNumber:=Module_SalesLedger
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Sales Ledger"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{4}:="Menu Sales"
		<>Mod_al_STRres{4}:=28
		<>Mod_at_LocalisedModuleName{4}:="MenuItem_SalesLedger"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{4}:=6  //8
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{4}:="Green"
		$_l_ModuleNumber:=Module_PurchaseLedger
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Purchase Ledger"
		<>Mod_at_LocalisedModuleName{$_l_ModuleNumber}:="MenuItem_PurchaseLedger"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{5}:="Menu_Purch"
		<>Mod_al_STRres{5}:=29
		<>Mod_at_LocalisedModuleName{5}:="MenuItem_PurchaseLedger"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{5}:=7  //9
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{5}:="Red"
		
		$_l_ModuleNumber:=Module_NominalLedger
		
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="General Ledger"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{6}:="Menu Nom"
		<>Mod_al_STRres{6}:=30
		<>Mod_at_LocalisedModuleName{6}:="MenuItem_NominalLedger"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{6}:=8  //10
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{6}:="Cyan"
		
		$_l_ModuleNumber:=Module_StockControl
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Stock Control"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{7}:="Menu_Stock"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{7}:=25
		<>Mod_at_LocalisedModuleName{7}:="MenuItem_StockManager"
		<>Mod_al_ModuleOrder{7}:=3  //5
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{7}:="Purple"
		
		$_l_ModuleNumber:=Module_ServiceCentre
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Service Centre"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{8}:="Menu_Tech"
		<>Mod_al_STRres{8}:=31
		<>Mod_at_LocalisedModuleName{8}:="MenuItem_ServiceManager"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		
		<>Mod_al_ModuleOrder{8}:=9  //11
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{8}:="Gold"
		
		$_l_ModuleNumber:=Module_JobCosting
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Job Costing"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{9}:="Menu_Jobs"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{9}:=32
		<>Mod_at_LocalisedModuleName{9}:="MenuItem_JobCosts"
		<>Mod_al_ModuleOrder{9}:=10  //12
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{9}:="Green"
		
		
		$_l_ModuleNumber:=Module_FaxManager
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Fax Manager"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{11}:=""
		<>Mod_al_STRres{11}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{11}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{11}:=""
		
		$_l_ModuleNumber:=Module_Enquiries
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Enquiries"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{13}:=""
		<>Mod_al_STRres{13}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{13}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{13}:=""
		
		$_l_ModuleNumber:=14
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Campaign Manager"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{14}:=""  //"Menu_CM"
		<>Mod_al_STRres{14}:=0  //"Menu_CM"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{14}:=0  //2
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{14}:=""  //"Orange"
		
		$_l_ModuleNumber:=Module_SalesManager
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Sales Manager"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{15}:=""
		<>Mod_al_STRres{15}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_al_ModuleOrder{15}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{15}:=""
		
		$_l_ModuleNumber:=Module_Assemblies
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Assemblies"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{16}:=""
		<>Mod_al_STRres{16}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{16}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{16}:=""
		
		$_l_ModuleNumber:=Module_SalesOrders
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Sales Orders"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{17}:="Menu_SOP"
		<>Mod_al_STRres{17}:=26
		<>Mod_at_LocalisedModuleName{17}:="MenuItem_SalesOrders"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{17}:=4  //6
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{17}:="Green"
		
		$_l_ModuleNumber:=Module_PurchaseOrders
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Purchase Orders"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=True:C214
		<>Mod_at_ProcessFunction{18}:="Menu_POP"
		<>Mod_al_STRres{18}:=27
		<>Mod_at_LocalisedModuleName{18}:="MenuItem_PurchaseOrders"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{18}:=5  //7
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{18}:="Red"
		
		
		$_l_ModuleNumber:=19  //19
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Ad Booking"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{19}:=""
		<>Mod_al_STRres{19}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{19}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{19}:=""
		
		$_l_ModuleNumber:=20  //20
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="QuarkWriter"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{20}:=""  //"Menu Quark"
		<>Mod_al_STRres{20}:=0  //"Menu Quark"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{20}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{20}:=""
		
		
		$_l_ModuleNumber:=21  //21
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Remote Access"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{21}:="Menu_Remote"
		<>Mod_al_STRres{21}:=37
		<>Mod_at_LocalisedModuleName{21}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{21}:=15  //19
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{21}:="Blue"
		
		
		$_l_ModuleNumber:=Module_MultiCurrency
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Multi-Currency"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{22}:=""
		<>Mod_al_STRres{22}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{22}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{22}:=""
		
		
		
		$_l_ModuleNumber:=24
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Daybook Lite"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{24}:=0
		<>Mod_al_ModuleOrder{24}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{24}:=""
		
		
		$_l_ModuleNumber:=Module_Sequences
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Sequences"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{25}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{25}:=""
		
		$_l_ModuleNumber:=Module_PriceTable
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Price Table"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{26}:=0
		<>Mod_al_ModuleOrder{26}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{26}:=""
		
		
		
		$_l_ModuleNumber:=Module_SerialNos
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Serial Nos"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{27}:=0
		<>Mod_al_ModuleOrder{27}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{27}:=""
		
		$_l_ModuleNumber:=Module_ChequeWriter
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Cheque Writer"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{28}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{28}:=""
		
		$_l_ModuleNumber:=Module_MultiLayer
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Multi-Layer"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{29}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{29}:=""
		
		$_l_ModuleNumber:=30
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Daybook Silver Plus"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:="Menu_SilverP"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{30}:=0
		<>Mod_al_ModuleOrder{30}:=-1
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{30}:="Blue"
		
		$_l_ModuleNumber:=31
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Mailsort"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{31}:=0
		<>Mod_al_ModuleOrder{31}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{31}:=""
		
		
		
		$_l_ModuleNumber:=32
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Telephony"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:="Menu_Remote"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{32}:=0
		<>Mod_al_ModuleOrder{32}:=15  //19
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{32}:="Blue"
		
		$_l_ModuleNumber:=Module_Macros
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Macros"  //see IME_MacroFind
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{33}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{33}:=""
		
		$_l_ModuleNumber:=34
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Demo"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{34}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_ModuleOrder{34}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{34}:=""
		
		$_l_ModuleNumber:=35
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="QuickAddress"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{35}:=0
		<>Mod_al_ModuleOrder{35}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{35}:=""
		
		$_l_ModuleNumber:=Module_Subscriptions
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Subscriptions"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{36}:=0
		<>Mod_al_ModuleOrder{36}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{36}:=""
		
		$_l_ModuleNumber:=Module_DataManager
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Data Manager"  //see IME_MacroFind
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:="Menu_Lists"  //See also Menu_ModBar2
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{37}:=38  //See also Menu_ModBar2
		<>Mod_at_LocalisedModuleName{37}:="MenuItem_ConfigurationManager"
		<>Mod_al_ModuleOrder{37}:=16  //20
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{37}:="Blue"
		
		$_l_ModuleNumber:=Module_Companies
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Companies"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{38}:=0
		<>Mod_al_ModuleOrder{38}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{38}:=""
		
		$_l_ModuleNumber:=Module_Products
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Products"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{39}:=0
		<>Mod_al_ModuleOrder{39}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=4
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ModuleColourName{39}:=""
		
		$_l_ModuleNumber:=40
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="International"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{40}:=0
		<>Mod_al_ModuleOrder{40}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ModuleColourName{40}:=""
		
		$_l_ModuleNumber:=41
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Macintosh Access"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_al_STRres{41}:=0
		<>Mod_al_ModuleOrder{41}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{41}:=""
		$_l_ModuleNumber:=42
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Windows Access"
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{42}:=0
		<>Mod_al_ModuleOrder{42}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=1
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ModuleColourName{42}:=""
		
		$_l_ModuleNumber:=Module_IntServer
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Internet Manager"  //see IME_MacroFind
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:="Menu_Remote"
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=3
		<>Mod_al_STRres{43}:=0
		<>Mod_aBo_AtStartup{$_l_ModuleNumber}:=True:C214
		<>Mod_al_ModuleOrder{43}:=0  //  NG Currently no menu item for this
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{43}:="Blue"
		
		$_l_ModuleNumber:=44  //23/09/08 (moved from being mistakenly below this block)
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Spare 1"  //see IME_MacroFind
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_STRres{44}:=0
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_al_ModuleOrder{44}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{44}:=""
		
		
		$_l_ModuleNumber:=45
		<>Mod_at_ModuleName{$_l_ModuleNumber}:="Spare 2"  //see IME_MacroFind
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=False:C215
		<>Mod_at_ProcessFunction{$_l_ModuleNumber}:=""
		<>Mod_al_AccessControlLevel{$_l_ModuleNumber}:=0
		<>Mod_al_STRres{45}:=0
		<>Mod_al_ModuleOrder{45}:=0
		<>Mod_abo_HasIcon{$_l_ModuleNumber}:=(<>Mod_al_ModuleOrder{$_l_ModuleNumber}>0)
		<>Mod_at_ModuleColourName{45}:=""
		
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]Pref_OwnerID:4:=-1
		[PREFERENCES:116]IDNumber:1:=$_l_ModuleArraysID
		VARIABLE TO BLOB:C532(<>Mod_al_ModuleOrder; [PREFERENCES:116]DataBlob:2; *)
		
		VARIABLE TO BLOB:C532(<>Mod_at_ModuleColourName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_al_AccessControlLevel; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_abo_HasIcon; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_aBo_AtStartup; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_at_ModuleName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_at_ProcessFunction; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_al_STRres; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(<>Mod_at_LocalisedModuleName; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		
	Else 
		//ALERT("Loading modules from preferences")
		
		$_l_Offset:=0
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)=0)
			ALERT:C41("Blob size is zero preference id="+String:C10($_l_ModuleArraysID))
		End if 
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_al_ModuleOrder; $_l_Offset)
		If ($_l_Offset=0)
			$_bo_Resave:=True:C214
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_ModuleOrder; $_l_Offset)
			ARRAY LONGINT:C221(<>Mod_al_ModuleOrder; Size of array:C274($_al_ModuleOrder))
			For ($_l_Fill; 1; Size of array:C274($_al_ModuleOrder))
				<>Mod_al_ModuleOrder{$_l_Fill}:=$_al_ModuleOrder{$_l_Fill}
			End for 
			
		End if 
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_at_ModuleColourName; $_l_Offset)
		$_l_OffSetOld:=$_l_Offset
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_al_AccessControlLevel; $_l_Offset)
		If ($_l_Offset=0)
			$_bo_Resave:=True:C214
			$_l_Offset:=$_l_OffSetOld
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ai_AccessControlLevel; $_l_Offset)
			ARRAY LONGINT:C221(<>Mod_al_AccessControlLevel; Size of array:C274($_ai_AccessControlLevel))
			For ($_l_Fill; 1; Size of array:C274($_ai_AccessControlLevel))
				<>Mod_al_AccessControlLevel{$_l_Fill}:=$_ai_AccessControlLevel{$_l_Fill}
			End for 
			
		End if 
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_abo_HasIcon; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_aBo_AtStartup; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_at_ModuleName; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_at_ProcessFunction; $_l_Offset)
		For ($_l_Change; 1; Size of array:C274(<>Mod_at_ProcessFunction))
			If (Position:C15(" "; <>Mod_at_ProcessFunction{$_l_Change})>0)
				<>Mod_at_ProcessFunction{$_l_Change}:=Replace string:C233(<>Mod_at_ProcessFunction{$_l_Change}; " "; "_")
			End if 
		End for 
		$_l_OffSetOld:=$_l_Offset
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_al_STRres; $_l_Offset)
		If ($_l_Offset=0)
			$_bo_Resave:=True:C214
			$_l_Offset:=$_l_OffSetOld
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ai_STRres; $_l_Offset)
			ARRAY LONGINT:C221(<>Mod_al_STRres; Size of array:C274($_ai_STRres))
			For ($_l_Fill; 1; Size of array:C274($_ai_STRres))
				<>Mod_al_STRres{$_l_Fill}:=$_ai_STRres{$_l_Fill}
			End for 
			
		End if 
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>Mod_at_LocalisedModuleName; $_l_Offset)
		If ($_bo_Resave)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(<>Mod_al_ModuleOrder; [PREFERENCES:116]DataBlob:2; *)
			
			VARIABLE TO BLOB:C532(<>Mod_at_ModuleColourName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_al_AccessControlLevel; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_abo_HasIcon; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_aBo_AtStartup; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_at_ModuleName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_at_ProcessFunction; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_al_STRres; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>Mod_at_LocalisedModuleName; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
		End if 
		<>MOD_bo_ModuleDataLoaded:=True:C214
	End if 
End if 


CLEAR SEMAPHORE:C144("$ModifyingModulesArray")
ERR_MethodTrackerReturn("Modules_Array"; $_t_oldMethodName)
