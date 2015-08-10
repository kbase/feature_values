#include<../KBaseFeatureValues.spec>

module ClusterServicePy {

    /*
        Indicates true or false values, false = 0, true = 1
        @range [0,1]
    */
    typedef int boolean;

    /*
        clusters - set of lists consisting of positions of rows from original
            matrix;
        dendrogram - tree in Newick format (node names are positions of 
            rows from original matrix);
        meancor and msecs - optional properties of clusters; position in each 
            of these arrays corresponds to cluster label (minus 1 if cluster  
            labels start from 1).
    */
    typedef structure {
        KBaseFeatureValues.AnalysisReport report;
        list<int> cluster_labels;
        list<float> meancor;
        list<float> msecs;
        string dendrogram;
    } ClusterResults;

    /*
        Used as an analysis step before generating clusters using K-means 
        clustering, this method provides an estimate of K by [...]
    */
    funcdef estimate_k(KBaseFeatureValues.FloatMatrix2D matrix, int min_k, 
        int max_k, int max_iter, int random_seed, int neighb_size) 
        returns (KBaseFeatureValues.EstimateKResult);

    /*
        Used as an analysis step before generating clusters using K-means
        clustering, this method provides an estimate of K by [...]
    */
    funcdef estimate_k_new(KBaseFeatureValues.FloatMatrix2D matrix, int min_k,
        int max_k, string criterion, boolean usepam, float alpha, boolean diss,int random_seed)
        returns (KBaseFeatureValues.EstimateKResult);

    /*
        Clusters features by K-means clustering.
    */
    funcdef cluster_k_means(KBaseFeatureValues.FloatMatrix2D matrix,
         int k, int n_start, int max_iter, int random_seed, 
         string algorithm) returns (ClusterResults);

    /*
        Clusters features by hierarchical clustering.
    */
    funcdef cluster_hierarchical(KBaseFeatureValues.FloatMatrix2D matrix, 
        string distance_metric, string linkage_criteria,
        float height_cutoff, boolean process_rows)
        returns (ClusterResults);

    /*
        Given a ClusterSet with a dendogram built from a hierarchical clustering
        method, this function creates new clusters by cutting the dendogram at
        a specific hieght or by some other approach.
    */
    funcdef clusters_from_dendrogram(KBaseFeatureValues.FloatMatrix2D matrix, 
        string dendrogram, float height_cutoff) returns (ClusterResults);

    funcdef calc_cluster_qualities(list<int> cluster_labels) returns (ClusterResults);

};
