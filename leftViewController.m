
//  WorkOrderTableView
//
//  Created by admin on 13/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "leftViewController.h"
#import "WorkOrderGridCell.h"
@interface leftViewController ()

@end

@implementation leftViewController
{
    UITableView *WorkOrdertableView;
    NSString *soapMessage;
    NSMutableData *webResponseData;
    NSString *currentElement;
    NSFileManager *filemgr;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
}

- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
        //File System
    
       filemgr = [NSFileManager defaultManager];
   
       // Identify the documents directory
        dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);

    docsDir = dirPaths[0];

    // Build the path to the data file
   dataFile = [docsDir stringByAppendingPathComponent:
                @"datafile.dat"];

    // Check if the file already exists
    if ([filemgr fileExistsAtPath: dataFile])
   {
       // Read file contents and display in textBox
        NSData *databuffer;
       databuffer = [filemgr contentsAtPath: dataFile];

        NSString *datastring = [[NSString alloc]
                                initWithData: databuffer
                                encoding:NSASCIIStringEncoding];

    }



   //Add view for sorting
    // Calling Webservice

    [self LoadWorkOrder];

   //Setting the table view
   //Check for data length and call the tableview
    WorkOrdertableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height)];
    self.edgesForExtendedLayout = UIRectEdgeNone;    // add to canvas

    WorkOrdertableView.delegate = self;
    WorkOrdertableView.dataSource = self;

   [self.view addSubview:WorkOrdertableView];
   [self->WorkOrdertableView registerNib:[UINib nibWithNibName: @"WorkOrderGridCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self->WorkOrdertableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
//    UILabel *dcGrounds =  [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 21)];
//    dcGrounds.text = @"DC Grounds";
//    [dcGrounds setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
//    [self.view addSubview:dcGrounds];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)LoadWorkOrder
{
    // Check for connectivity
    
    soapMessage = [NSString stringWithFormat:@"<soapenv:Envelope xmlns:soapenv=\"http://                schemas.xmlsoap.org/soap/envelope/"
                   "xmlns:urn=\"urn:sap-com:document:sap:rfc:functions\">"
                   "<soapenv:Header/>"
                   "<soapenv:Body>"
                   "<urn:ZPM_SGI_ORDER_GETDETAIL>"
                   "<!--Optional:-->"
                   "<MAINWORKCTR>SUBINSP</MAINWORKCTR>"
                   "<!--Optional:-->"
                   "<PLANNINGPLANT>SALI</PLANNINGPLANT>"
                   "</urn:ZPM_SGI_ORDER_GETDETAIL>"
                   "</soapenv:Body>"
                   "</soapenv:Envelope>" ];
    
    //Now create a request to the URL
    NSURL *url = [NSURL URLWithString:@"http://typhoon.pepcoholdings.biz:8080/sap/bc/srt/rfc/sap/zpm_sgi_001/100/zpm_sgi_001/ws_sgi_001_binding"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    //ad required headers to the request
    //    [theRequest addValue:@"www.w3schools.com" forHTTPHeaderField:@"Host"];
    //    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //    [theRequest addValue: @"http://www.w3schools.com/webservices/CelsiusToFahrenheit" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initiate the request
    NSURLConnection *connection =
    [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if(connection)
    {
        webResponseData = [NSMutableData data] ;
    }
    else
    {
        NSLog(@"Connection is NULL");
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    WorkOrderGridCell *cell = (WorkOrderGridCell *)[WorkOrdertableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // If there is no cell to reuse, create a new one
    if(cell == nil)
    {
        cell = [[WorkOrderGridCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell before it is displayed...
    //TextFieldFormElement *item = [self.formItems objectAtIndex:indexPath.row];
    
    
    //Read
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row ==0)
    {
        cell.SubstationName.text = @"Substation1";
        cell.WorkOrderNumber.text =@"1213434";
        cell.EquipmentID.text =@"565344";
        cell.Status.text=@"SUSPENDED";
        cell.DueDate.text=@"08/11/14";
        
    }
    else if (indexPath.row == 1)
    {
        cell.SubstationName.text = @"Substation2";
        cell.WorkOrderNumber.text =@"5656544";
        cell.EquipmentID.text =@"897222";
        cell.Status.text=@"SUBMITTED";
        cell.DueDate.text=@"08/11/14";
        
    }
    else if (indexPath.row ==2)
    {
        cell.SubstationName.text = @"Substation3";
        cell.WorkOrderNumber.text =@"8767655";
        cell.EquipmentID.text =@"379326";
        cell.Status.text=@"SUSPENDED";
        cell.DueDate.text=@"20/11/14";
    }
    else if (indexPath.row ==3)
    {
        cell.SubstationName.text = @"Substation4";
        cell.WorkOrderNumber.text =@"4533456";
        cell.EquipmentID.text =@"884532";
        cell.Status.text=@"INITIATED";
        cell.DueDate.text=@"30/11/14";
    }
    else if (indexPath.row ==4)
    {
        cell.SubstationName.text = @"Substation5";
        cell.WorkOrderNumber.text =@"9089077";
        cell.EquipmentID.text =@"976378";
        cell.Status.text=@"SUSPENDED";
        cell.DueDate.text=@"08/11/14";
    }
    else if (indexPath.row ==5)
    {
        cell.SubstationName.text = @"Substation6";
        cell.WorkOrderNumber.text =@"1245689";
        cell.EquipmentID.text =@"535674";
        cell.Status.text=@"SUBMITTED";
        cell.DueDate.text=@"30/11/14";
    }
    else if (indexPath.row ==6)
    {
        cell.SubstationName.text = @"Substation7";
        cell.WorkOrderNumber.text =@"7889066";
        cell.EquipmentID.text =@"812345";
        cell.Status.text=@"SUSPENDED";
        cell.DueDate.text=@"20/11/14";
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}
#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}


//Implement the connection delegate methods.
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self->webResponseData  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self->webResponseData  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again.");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Received %d Bytes", [webResponseData length]);
    NSString *theXML = [[NSString alloc] initWithBytes:
                        [webResponseData mutableBytes] length:[webResponseData length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",theXML);
    
    //now parsing the xml
    
    NSData *myData = [theXML dataUsingEncoding:NSUTF8StringEncoding];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:myData];
    
    //setting delegate of XML parser to self
    xmlParser.delegate = self;
    
    // Run the parser
    @try{
        BOOL parsingResult = [xmlParser parse];
        NSLog(@"parsing result = %hhd",parsingResult);
    }
    @catch (NSException* exception)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:[exception reason] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
}

//Implement the NSXmlParserDelegate methods
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:
(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = elementName;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([currentElement isEqualToString:@"CelsiusToFahrenheitResult"]) {
        // self.resultLabel.text = string;
    }
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"Parsed Element : %@", currentElement);
    //Store the data in the file
    //    filemgr = [NSFileManager defaultManager];
    //
    //    dirPaths = NSSearchPathForDirectoriesInDomains(
    //                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    //
    //    docsDir = dirPaths[0];
    //    dataFile = [docsDir
    //                stringByAppendingPathComponent: @"datafile.dat"];
    //    databuffer = [_textBox.text
    //                  dataUsingEncoding: NSASCIIStringEncoding];
    //    [filemgr createFileAtPath: dataFile
    //                     contents: databuffer attributes:nil];
}


@end

