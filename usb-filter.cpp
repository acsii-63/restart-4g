#include <iostream>
#include <fstream>
#include <string>

int main()
{
    // File containing all the USB ports the SIM7600G-H 4G Module connects to (get from dmesg)
    std::fstream dev_file;
    // File containing the last USB port the SIM7600G-H 4G Module connected to
    std::fstream port_file;

    dev_file.open("detect_device.txt", std::fstream::in);
    port_file.open("usb_port.txt", std::fstream::out);

    /* The input file always has an empty line at the end of it. */

    // Read the lines of the file one by one
    std::string line = "not an empty string";
    // String with the last port
    std::string final_line;

    // Loop until read the empty line at the end of the file.
    while (line.size() != 0)
    {
        final_line = line;
        std::getline(dev_file, line, '\n');
    }
    // Find the port in string
    size_t found = final_line.find("usb");
    
    if (found != std::string::npos)
    {
        port_file << final_line.substr(found + 4, 5);
        std::cout << "SIM7600G-H found at USB " << final_line.substr(found + 4, 5) << " port" << std::endl;
    }
    else
        std::cout << "SIM7600G-H 4G Module not found, please check your connect between the Module and Jetson" << std::endl;

    dev_file.close();
    port_file.close();

    return 0;
}