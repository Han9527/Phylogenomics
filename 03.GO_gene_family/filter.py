import os
os.chdir("/home/sda1/workspace/MetalRNA/18.comparative_genome/01.aa/14.only_barley/03.GO_gene_family")
os.getcwd()
metal_id=[]
with open("new_metal_gene.txt","r") as f1:
    for line in f1.readlines():
        metal_id.append(line.strip("\n"))
gene_ortho=[]
with open("barley.ortho.txt", "r") as f2:
    for i in f2.readlines():
        ortho_group=i.split("\t")[0]
        ortho_line=i.split("\t")[1].strip("\n")
        #print(ortho_line)
        for gene in ortho_line.split(","):
            single_gene=gene.strip(" ")
            if single_gene in metal_id:
                metal_ortho=ortho_group+": "+single_gene
                gene_ortho.append(metal_ortho)
with open("gene_ortho.txt", "w") as f3:
    for group in gene_ortho:
        #print(group)
        f3.write(group+"\n")
