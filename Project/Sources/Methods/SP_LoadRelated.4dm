//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadRelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($6; SP_RecordsFound)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadRelated")

//$1=Pointer to variable containing related table number
//$2=Pointer to variable containing related numeric record number(x_ID)
//$3=pointer to Variable containing related STR(55) Alpha record number(code)
If ($1->>0)
	Case of 
		: ($1->=Table:C252(->[PROJECTS:89]))
			
			READ ONLY:C145([PROJECTS:89])
			If ($2->>0)
				If (Count parameters:C259>=6)
					SET QUERY DESTINATION:C396(3; SP_RecordsFound)
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
					SET QUERY DESTINATION:C396(0)
					If (SP_RecordsFound=0)
						QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=$2->)
						$3->:=[PROJECTS:89]Project_Code:1
					Else 
						Gen_Alert("This Project already has a Pipeline entered")
						$2->:=0
						$3->:=""
					End if 
				Else 
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=$2->)
					$3->:=[PROJECTS:89]Project_Code:1
					
				End if 
				
			Else 
				If ($3->#"")
					
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Code:1=$3->)
					If ($4->>0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
						QUERY SELECTION:C341([PROJECTS:89]; [PROJECTS:89]Company_Code:3=[COMPANIES:2]Company_Code:1)
						UNLOAD RECORD:C212([COMPANIES:2])
					End if 
					Case of 
						: (Records in selection:C76([PROJECTS:89])=1)
							$2->:=[PROJECTS:89]X_ID:11
							$3->:=[PROJECTS:89]Project_Code:1
							If (Count parameters:C259>=6)
								SET QUERY DESTINATION:C396(3; SP_RecordsFound)
								QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
								SET QUERY DESTINATION:C396(0)
								If (SP_RecordsFound>0)
									Gen_Alert("This Project already has a Pipeline entered")
									$2->:=0
									$3->:=""
								End if 
							End if 
							
						: (Records in selection:C76([PROJECTS:89])>1)
							Case of 
								: (Count parameters:C259>=4)
									If ($4->>0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
										QUERY SELECTION:C341([PROJECTS:89]; [PROJECTS:89]Company_Code:3=[COMPANIES:2]Company_Code:1)
										Check_MinorNC($3; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project"; "-1"; False:C215)
										UNLOAD RECORD:C212([COMPANIES:2])
									Else 
										Check_MinorNC($3; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project"; "-1"; False:C215)
									End if 
								Else 
									Check_MinorNC($3; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project"; "-1"; False:C215)
							End case 
							If (Records in selection:C76([PROJECTS:89])=1)
								$2->:=[PROJECTS:89]X_ID:11
								$3->:=[PROJECTS:89]Project_Code:1
								If (Count parameters:C259>=6)
									SET QUERY DESTINATION:C396(3; SP_RecordsFound)
									QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
									SET QUERY DESTINATION:C396(0)
									If (SP_RecordsFound>0)
										Gen_Alert("This Project already has a Pipeline entered")
										$2->:=0
										$3->:=""
									End if 
								End if 
								
							End if 
						: (Records in selection:C76([PROJECTS:89])=0)
							Gen_Alert("This Project does not exist")
							$3->:=""
							$2->:=0
					End case 
					
				End if 
			End if 
		: ($1->=Table:C252(->[JOBS:26]))
			
			READ ONLY:C145([JOBS:26])
			If ($2->>0)
				If (Count parameters:C259>=6)
					SET QUERY DESTINATION:C396(3; SP_RecordsFound)
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
					SET QUERY DESTINATION:C396(0)
					If (SP_RecordsFound=0)
						QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$2->)
						$3->:=[JOBS:26]Job_Code:1
					Else 
						Gen_Alert("This Job already has a Pipeline entered")
						$2->:=0
						$3->:=""
					End if 
				Else 
					QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=$2->)
					$3->:=[JOBS:26]Job_Code:1
				End if 
				
			Else 
				If ($3->#"")
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$3->)
					If ($4->>0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
						QUERY SELECTION:C341([JOBS:26]; [JOBS:26]Company_Code:3=[COMPANIES:2]Company_Code:1)
						UNLOAD RECORD:C212([COMPANIES:2])
					End if 
					Case of 
						: (Records in selection:C76([JOBS:26])=1)
							$2->:=[JOBS:26]x_ID:49
							$3->:=[JOBS:26]Job_Code:1
							If (Count parameters:C259>=6)
								SET QUERY DESTINATION:C396(3; SP_RecordsFound)
								QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
								SET QUERY DESTINATION:C396(0)
								If (SP_RecordsFound>0)
									Gen_Alert("This Job already has a Pipeline entered")
									$2->:=0
									$3->:=""
								End if 
							End if 
							
						: (Records in selection:C76([JOBS:26])>1)
							Case of 
								: (Count parameters:C259>=4)
									If ($4->>0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
										Check_MinorNC($3; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job"; "-1"; False:C215)
										UNLOAD RECORD:C212([COMPANIES:2])
									Else 
										Check_MinorNC($3; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job"; "-1"; False:C215)
									End if 
								Else 
									Check_MinorNC($3; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job"; "-1"; False:C215)
							End case 
							If (Records in selection:C76([JOBS:26])=1)
								$2->:=[JOBS:26]x_ID:49
								$3->:=[JOBS:26]Job_Code:1
								If (Count parameters:C259>=6)
									SET QUERY DESTINATION:C396(3; SP_RecordsFound)
									QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
									SET QUERY DESTINATION:C396(0)
									If (SP_RecordsFound>0)
										Gen_Alert("This Job already has a Pipeline entered")
										$2->:=0
										$3->:=""
									End if 
								End if 
							End if 
						: (Records in selection:C76([JOBS:26])=0)
							Gen_Alert("This Job does not exist")
							$3->:=""
							$2->:=0
					End case 
				End if 
				
			End if 
			
		: ($1->=Table:C252(->[ORDERS:24]))
			
			READ ONLY:C145([ORDERS:24])
			If ($2->>0)
				If (Count parameters:C259>=6)
					SET QUERY DESTINATION:C396(3; SP_RecordsFound)
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
					SET QUERY DESTINATION:C396(0)
					If (SP_RecordsFound=0)
						QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=$2->)
						$3->:=[ORDERS:24]Order_Code:3
					Else 
						Gen_Alert("This Order already has a Pipeline entered")
						$2->:=0
						$3->:=""
					End if 
				Else 
					QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=$2->)
					$3->:=[ORDERS:24]Order_Code:3
				End if 
				
			Else 
				If ($3->#"")
					
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$3->)
					
					
					If (Count parameters:C259>=4)
						If ($4->>0)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
							QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
							UNLOAD RECORD:C212([COMPANIES:2])
						End if 
					End if 
					
					If (Count parameters:C259>=5)
						If ($5->>0)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$5->)
							QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Contact_Code:2=[CONTACTS:1]Contact_Code:2)
							UNLOAD RECORD:C212([CONTACTS:1])
						End if 
					End if 
					Case of 
						: (Records in selection:C76([ORDERS:24])=1)
							$2->:=[ORDERS:24]x_ID:58
							$3->:=[ORDERS:24]Order_Code:3
							If (Count parameters:C259>=6)
								SET QUERY DESTINATION:C396(3; SP_RecordsFound)
								QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
								QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
								SET QUERY DESTINATION:C396(0)
								If (SP_RecordsFound>0)
									Gen_Alert("This order already has a Pipeline entered")
									$2->:=0
									$3->:=""
								End if 
							End if 
						: (Records in selection:C76([ORDERS:24])>1)
							Case of 
								: (Count parameters:C259>=4)
									If ($4->>0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$4->)
										Check_MinorNC($3; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order"; "-1"; False:C215)
										UNLOAD RECORD:C212([COMPANIES:2])
									Else 
										Check_MinorNC($3; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order"; "-1"; False:C215)
									End if 
								Else 
									Check_MinorNC($3; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order"; "-1"; False:C215)
							End case 
							If (Records in selection:C76([ORDERS:24])=1)
								$2->:=[ORDERS:24]x_ID:58
								$3->:=[ORDERS:24]Order_Code:3
								If (Count parameters:C259>=6)
									SET QUERY DESTINATION:C396(3; SP_RecordsFound)
									QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1#$6; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1->; *)
									QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2->)
									SET QUERY DESTINATION:C396(0)
									If (SP_RecordsFound>0)
										Gen_Alert("This order already has a Pipeline entered")
										$2->:=0
										$3->:=""
									End if 
								End if 
							End if 
						: (Records in selection:C76([ORDERS:24])=0)
							Gen_Alert("This order does not exist")
							$2->:=0
							$3->:=""
					End case 
					
				End if 
			End if 
			
		Else 
			ALERT:C41("Unimplimented feature-contact programming team. Table"+String:C10($1->))
			Gen_Alert("Unimplimented feature-contact programming team. Table"+String:C10($1->))
	End case 
End if 
ERR_MethodTrackerReturn("SP_LoadRelated"; $_t_oldMethodName)
