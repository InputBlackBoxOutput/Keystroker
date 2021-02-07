/*
*  File Name: USBdsc.c
*  Description: Provides USB & HID descriptors for USB enumeration.
*
*  Written by Rutuparn Pawar
*  Created on 5 Oct 2019
*/

const unsigned int USB_VENDOR_ID = 0x1234;
const unsigned int USB_PRODUCT_ID = 0x0001;
const char USB_SELF_POWER = 0x80;              // Self powered 0xC0,  0x80 bus powered
const char USB_MAX_POWER = 50;                 // Bus power required in units of 2 mA
const char HID_INPUT_REPORT_BYTES = 64;
const char HID_OUTPUT_REPORT_BYTES = 64;
const char USB_TRANSFER_TYPE = 0x03;           //0x03 Interrupt
const char EP_IN_INTERVAL = 1;
const char EP_OUT_INTERVAL = 1;

const char USB_INTERRUPT = 1;
const char USB_HID_IN_EP = 1;
const char USB_HID_OUT_EP = 1;
// const char USB_HID_RPT_SIZE = 33;           // This is auto-generated
const char USB_HID_RPT_SIZE = 63;

/* Device Descriptor */
const struct {
    char bLength;               // bLength         - Descriptor size in bytes (12h)
    char bDescriptorType;       // bDescriptorType - The constant DEVICE (01h)
    unsigned int bcdUSB;        // bcdUSB          - USB specification release number (BCD)
    char bDeviceClass;          // bDeviceClass    - Class Code
    char bDeviceSubClass;       // bDeviceSubClass - Subclass code
    char bDeviceProtocol;       // bDeviceProtocol - Protocol code
    char bMaxPacketSize0;       // bMaxPacketSize0 - Maximum packet size for endpoint 0
    unsigned int idVendor;      // idVendor        - Vendor ID
    unsigned int idProduct;     // idProduct       - Product ID
    unsigned int bcdDevice;     // bcdDevice       - Device release number (BCD)
    char iManufacturer;         // iManufacturer   - Index of string descriptor for the manufacturer
    char iProduct;              // iProduct        - Index of string descriptor for the product.
    char iSerialNumber;         // iSerialNumber   - Index of string descriptor for the serial number.
    char bNumConfigurations;    // bNumConfigurations - Number of possible configurations
} device_dsc = {
      0x12,                   // bLength
      0x01,                   // bDescriptorType
      0x0200,                 // bcdUSB
      0x00,                   // bDeviceClass
      0x00,                   // bDeviceSubClass
      0x00,                   // bDeviceProtocol
      8,                      // bMaxPacketSize0
      USB_VENDOR_ID,          // idVendor
      USB_PRODUCT_ID,         // idProduct
      0x0100,                 // bcdDevice
      0x01,                   // iManufacturer
      0x02,                   // iProduct
      0x00,                   // iSerialNumber
      0x01                    // bNumConfigurations
  };

/* Configuration 1 Descriptor */
const char configDescriptor1[]= {
    // Configuration Descriptor
    0x09,                   // bLength             - Descriptor size in bytes
    0x02,                   // bDescriptorType     - The constant CONFIGURATION (02h)
    0x29,0x00,              // wTotalLength        - The number of bytes in the configuration descriptor and all of its subordinate descriptors
    1,                      // bNumInterfaces      - Number of interfaces in the configuration
    1,                      // bConfigurationValue - Identifier for Set Configuration and Get Configuration requests
    0,                      // iConfiguration      - Index of string descriptor for the configuration
    USB_SELF_POWER,         // bmAttributes        - Self/bus power and remote wakeup settings
    USB_MAX_POWER,          // bMaxPower           - Bus power required in units of 2 mA

    // Interface Descriptor
    0x09,                   // bLength - Descriptor size in bytes (09h)
    0x04,                   // bDescriptorType - The constant Interface (04h)
    0,                      // bInterfaceNumber - Number identifying this interface
    0,                      // bAlternateSetting - A number that identifies a descriptor with alternate settings for this bInterfaceNumber.
    2,                      // bNumEndpoint - Number of endpoints supported not counting endpoint zero
    0x03,                   // bInterfaceClass - Class code
    0,                      // bInterfaceSubclass - Subclass code
    0,                      // bInterfaceProtocol - Protocol code
    0,                      // iInterface - Interface string index

    // HID Class-Specific Descriptor
    0x09,                   // bLength - Descriptor size in bytes.
    0x21,                   // bDescriptorType - This descriptor's type: 21h to indicate the HID class.
    0x01,0x01,              // bcdHID - HID specification release number (BCD).
    0x00,                   // bCountryCode - Numeric expression identifying the country for localized hardware (BCD) or 00h.
    1,                      // bNumDescriptors - Number of subordinate report and physical descriptors.
    0x22,                   // bDescriptorType - The type of a class-specific descriptor that follows
    USB_HID_RPT_SIZE,0x00,  // wDescriptorLength - Total length of the descriptor identified above.

    // Endpoint Descriptor
    0x07,                   // bLength - Descriptor size in bytes (07h)
    0x05,                   // bDescriptorType - The constant Endpoint (05h)
    USB_HID_IN_EP | 0x80,   // bEndpointAddress - Endpoint number and direction
    USB_TRANSFER_TYPE,      // bmAttributes - Transfer type and supplementary information
    0x40,0x00,              // wMaxPacketSize - Maximum packet size supported
    EP_IN_INTERVAL,         // bInterval - Service interval or NAK rate

    // Endpoint Descriptor
    0x07,                   // bLength - Descriptor size in bytes (07h)
    0x05,                   // bDescriptorType - The constant Endpoint (05h)
    USB_HID_OUT_EP,         // bEndpointAddress - Endpoint number and direction
    USB_TRANSFER_TYPE,      // bmAttributes - Transfer type and supplementary information
    0x40,0x00,              // wMaxPacketSize - Maximum packet size supported    
    EP_OUT_INTERVAL         // bInterval - Service interval or NAK rate
};

/*USB HID Keyboard Descriptor*/
const struct {
  char report[USB_HID_RPT_SIZE];
} hid_rpt_desc =
{
  {
    0x05, 0x01,   // USAGE_PAGE (Genric Desktop)
    0x09, 0x06,   // USAGE (Keyboard)
    0xA1, 0x01,   // COLLECTION (Application)
    0x05, 0x07,   // USAGE_PAGE (keyboard)
    0x19, 0xE0,   // USAGE_MINIMUM
    0x29, 0xE7,   // USAGE_MAXIMUM
    0x15, 0x00,   // LOGICAL_MINIMUM (0)
    0x25, 0x01,   // LOGICAL_MAXIMUM (1)
    0x75, 0x01,   // REPORT_SIZE (1)
    0x95, 0x08,   // REPORT_COUNT (8)
    0x81, 0x02,   // INPUT (Data,Var,Abs)
    0x95, 0x01,   // REPORT_COUNT (1)
    0x75, 0x08,   // REPORT_SIZE (8)
    0x81, 0x03,   // INPUT (Cnst,Var,Abs)
    0x95, 0x05,   // REPORT_COUNT (5)
    0x75, 0x01,   // REPORT_SIZE (1)
    0x05, 0x08,   // USAGE_PAGE (LEDs)
    0x19, 0x01,   // USAGE_MINIMUM (Num Lock)
    0x29, 0x05,   // USAGE_MAXIMUM (Kana)
    0x91, 0x02,   // OUTPUT (Data,Var,Abs)
    0x95, 0x01,   // REPORT_COUNT (1)
    0x75, 0x03,   // REPORT_SIZE (3)
    0x91, 0x03,   // OUTPUT (Cnst,Var,Abs)
    0x95, 0x06,   // REPORT_COUNT (6)
    0x75, 0x08,   // REPORT_SIZE (8)
    0x15, 0x00,   // LOGICAL_MINIMUM (0)
    0x25, 0x65,   // LOGICAL_MAXIMUM (101)
    0x05, 0x07,   // USAGE_PAGE (Keyboard)
    0x19, 0x00,   // USAGE_MINIMUM (Reserved (no event indicated))
    0x29, 0x65,   // USAGE_MAXIMUM (Keyboard Application)
    0x81, 0x00,   // INPUT (Data,Ary,Abs)
    0xC0          // END COLLECTION
  }
};

//Language code string descriptor
const struct {
  char bLength;
  char bDscType;
  unsigned int string[1];
  } strd1 = {
      4,
      0x03,
      {0x0409}
    };


//Manufacturer string descriptor
const struct{
  char bLength;
  char bDscType;
  unsigned int string[9];
  } strd2={
    20,           //sizeof this descriptor string
    0x03,
    {'M','i','c','r','o','c','h','i','p'}
  };

//Product string descriptor
const struct{
  char bLength;
  char bDscType;
  unsigned int string[12];
  } strd3={
    26,          //sizeof this descriptor string
    0x03,
    {'U','S','B',' ','K','e','y','b','o','a','r','d'}
 };

//Array of configuration descriptors
const char* USB_config_dsc_ptr[1];

//Array of string descriptors
const char* USB_string_dsc_ptr[3];

void USB_Init_Desc(){
  USB_config_dsc_ptr[0] = &configDescriptor1;
  USB_string_dsc_ptr[0] = (const char*)&strd1;
  USB_string_dsc_ptr[1] = (const char*)&strd2;
  USB_string_dsc_ptr[2] = (const char*)&strd3;
}

/////////////////////////////////////////////////////////////////////////////////////