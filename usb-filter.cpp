#include <iostream>
#include <fstream>
#include <string>

int main()
{
    std::fstream dev_file;
    std::fstream port_file;

    dev_file.open("detect_device.txt", std::fstream::in);
    port_file.open("usb_port.txt", std::fstream::out);

    std::string line;

    while (!dev_file.eof())
        std::getline(dev_file, line, '\n');

    size_t found = line.find("usb");

    if (found != std::string::npos)
    {
        port_file << line.substr(found + 4, 5);
        std::cout << "SIM7600G-H found at USB "<< line.substr(found + 4, 5) << " port";
    }
    else
        std::cout << "SIM7600G-H 4G Module not found, please check your connect between the Module and Jetson";

    dev_file.close();
    port_file.close();

    return 0;
}