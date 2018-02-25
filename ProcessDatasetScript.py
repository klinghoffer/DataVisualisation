import csv
with open('DataSet.csv', 'r') as csvfile:
    dataset = csv.DictReader(csvfile)
    dateStrings = []
    precipitationStrings = []
    for row in dataset:
        try:
            if float(row['PRCP']) and float(row['PRCP']) > 1:
                dateStrings.append(row['DATE'])
                precipitationStrings.append(row['PRCP'])
        except Exception as e:
            print(row['PRCP'])
            
    with open('dataset.txt', 'w') as output:
        print("class DataSet {", file=output)
        print("String dateStrings[] = new String[{}];".format(len(dateStrings)), file=output)
        print("Float  precipitationValues[] = new Float[{}];".format(len(dateStrings)), file=output)

        print("DataSet() {", file=output)
        for i in range(len(dateStrings)):
            print("dateStrings[{}] = \"{}\";".format(i, dateStrings[i]), file=output)
            print("precipitationValues[{}] = {};".format(i, precipitationStrings[i]), file=output)
        print("}", file=output)

        print("}", file=output)
