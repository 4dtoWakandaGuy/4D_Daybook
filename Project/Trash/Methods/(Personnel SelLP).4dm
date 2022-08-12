//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Personnel SelLP
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
	C_LONGINT:C283($0; $1; $2; $3; $mi; vAButt; vAny; vC; vD; vNo; vO)
	C_LONGINT:C283(vOrd; vOrdi; vP)
	C_POINTER:C301($4; $5; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSelPrev; vTitle11)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel SelLP")

If (Count parameters:C259=0)
	$mi:=Sel_LPmi("Personnel SelLP")
Else 
	
	If ($1>0)
		$Mi:=$1
		If ($mi=5)
			$mi:=7
		End if 
	Else 
		$mi:=Sel_LPmi("Personnel SelLP")
	End if 
End if 
$0:=0
If ($mi>0)
	vTitle11:=""
	vFilePtr:=->[PERSONNEL:11]
	vAny:=0
	vSelPrev:=""
	// ALL RECORDS([PERSONNEL])`10/07/02 pb
	
	//  QUERY SELECTION([PERSONNEL];[PERSONNEL]PersonDeleted#1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1)  //10/07/02 pb
	
	Case of 
		: ($mi=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Sales_Person:29; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Sales_Person:29; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Sales_Person:29; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=2)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Taken_By:26; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Taken_By:26; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[COMPANIES:2]; ->vC; ->vP; "Comp_SelP"; "One"; ""; ""; ->[COMPANIES:2]Taken_By:26; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=3)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[CONTACTS:1]; ->vO; ->vP; "Cont_SelP"; "One"; ""; ""; ->[CONTACTS:1]Sales_Person:25; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[CONTACTS:1]; ->vO; ->vP; "Cont_SelP"; "One"; ""; ""; ->[CONTACTS:1]Sales_Person:25; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "AMaster"; ""; ->vAButt; ->[CONTACTS:1]; ->vO; ->vP; "Cont_SelP"; "One"; ""; ""; ->[CONTACTS:1]Sales_Person:25; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=4)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Person:8; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Person:8; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Person:8; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
			
		: ($mi=5)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Originator:23; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Originator:23; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(2; 0; 0; "AMaster"; ""; ->vAButt; ->[DIARY:12]; ->vD; ->vP; "Diary_SelP"; "One"; ""; ""; ->[DIARY:12]Originator:23; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=6)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Person:5; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Person:5; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Person:5; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=7)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Taken_By:17; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Taken_By:17; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDERS:24]; ->vOrd; ->vP; "Orders_SelP"; "One"; ""; ""; ->[ORDERS:24]Taken_By:17; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
		: ($mi=8)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; ""; ""; ->[ORDER_ITEMS:25]Person:14; ->[PERSONNEL:11]Initials:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; ""; ""; ->[ORDER_ITEMS:25]Person:14; ->[PERSONNEL:11]Initials:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(17; 13; 0; "AMaster"; ""; ->vAButt; ->[ORDER_ITEMS:25]; ->vOrdi; ->vP; "OrderI_SelP"; "One"; ""; ""; ->[ORDER_ITEMS:25]Person:14; ->[PERSONNEL:11]Initials:1; -1; $3; $4; $5)
				End if 
				
			End if 
	End case 
End if 
vNo:=Records in selection:C76([PERSONNEL:11])
ERR_MethodTrackerReturn("Personnel SelLP"; $_t_oldMethodName)