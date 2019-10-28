# ------------------------------------------------------------------------------
# Copyright (C) 2018-2019 University of Liège
# <penPHcure is an R package for for estimation, variable selection and 
#  simulation of the semiparametric proportional-hazards (PH) cure model with 
#  time-varying covariates.>
# Authors: Alessandro Beretta & Cédric Heuchenne
# Contact: a.beretta@uliege.be
# 
# Licence as published by the Free Software Foundation, either version 3 of the 
# Licence, or any later version. This program is distributed in the hope that it 
# will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General 
# Public Licence for more details. You should have received a copy of the GNU 
# General Public Licence along with this program.
# If not, see <http://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------------
#
#' @title Summary method for PHcure.object
#' @description Produces a summary of a fitted PH cure model
#' @param object an object of class \code{\link{PHcure.object}}.
#' @param conf.int a character string indicating the method to compute bootstrapped confidence intervals: \code{"percentile"} or \code{"basic"}. By default \code{conf.int = "basic"}.  
#' @param conf.int.level confidence level. By default \code{conf.int.level = 0.95}.
#' @param ... ellipsis to pass extra arguments.
#' @usage
#'  \method{summary}{PHcure}(object, conf.int = c("basic","percentile"), conf.int.level = 0.95,...) 
#' @return An object of class \code{summary.PHcure}, a list including the following elements:
#'  \item{\code{N}}{the sample size (number of individuals).}
#'  \item{\code{censoring}}{the proportion of censored individuals.}
#'  \item{\code{K}}{the number of unique failure times.}
#'  \item{\code{isTies}}{a logical value, equal to \code{TRUE} in case of tied event times.}
#'  \item{\code{conf.int}}{a character string indicating the method used to compute the bootstrapped confidence intervals: \code{"percentile"}, \code{"basic"} or \code{"no"}. The latter is returned when the \code{\link{penPHcure}} function was called with the argument \code{inference = FALSE}.}
#'  \item{\code{conf.int.level}}{confidence level used to compute the bootstrapped confidence intervals.}
#'  \item{\code{logL}}{the value of the log-likelihood for the estimated model.}
#'  \item{\code{CURE}}{a matrix with one column containing the estimated regression coefficients in the incidence (cure) component. In case the function \code{\link{penPHcure}} was called with the argument \code{inference = TRUE}, two additional columns for the confidence intervals are provided.}
#'  \item{\code{SURV}}{a matrix where in the first column the estimated regression coefficients in the latency (survival) component. In case the function \code{\link{penPHcure}} was called with the argument \code{inference = TRUE}, two additional columns for the confidence intervals are provided.}
#'
#' @examples
#' # For reproducibility
#' set.seed(3) 
#' # Un-comment the following line if you use R (>=3.6)
#' # RNGkind(sample.kind="Rounding") 
#' 
#' # Generate some data (for more details type ?penPHcure.simulate in your console)
#' data <- penPHcure.simulate()
#'  
#' # Fit standard cure model (without inference)
#' fit <- penPHcure(Surv(time = tstart,time2 = tstop,
#'                       event = status) ~ z.1 + z.2 + z.3 + z.4,
#'                  cureform = ~ x.1 + x.2 + x.3 + x.4,data = data)
#'
#' # Use the summary method to see the results
#' summary(fit)
#' #
#' # ------------------------------------------------------
#' # +++   PH cure model with time-varying covariates   +++
#' # ------------------------------------------------------
#' # Sample size: 500
#' # Censoring proportion: 0.56
#' # Number of unique event times: 220
#' # Tied failure times: FALSE
#' # 
#' # log-likelihood:  101.85 
#' # 
#' # ------------------------------------------------------
#' # +++         Cure (incidence) coefficients          +++
#' # ------------------------------------------------------
#' #              Estimate
#' # (Intercept)  1.136690
#' # x.1         -0.816737
#' # x.2          0.087270
#' # x.3          0.910139
#' # x.4          0.058115
#' # 
#' # ------------------------------------------------------
#' # +++         Survival (latency) coefficients         +++
#' # ------------------------------------------------------
#' #      Estimate
#' # z.1  1.033331
#' # z.2 -0.051417
#' # z.3 -0.881202
#' # z.4 -0.070461
#' 
#' \dontrun{
#' # Fit standard cure model (with inference)
#' fit2 <- penPHcure(Surv(time = tstart,time2 = tstop,
#'                        event = status) ~ z.1 + z.2 + z.3 + z.4,
#'                   cureform = ~ x.1 + x.2 + x.3 + x.4,data = data,
#'                   inference = TRUE)
#' # Use the summary method to see the results
#' summary(fit2)
#' #
#' # ------------------------------------------------------
#' # +++   PH cure model with time-varying covariates   +++
#' # ------------------------------------------------------
#' # Sample size: 500
#' # Censoring proportion: 0.56
#' # Number of unique event times: 220
#' # Tied failure times: FALSE
#' # 
#' # log-likelihood:  101.85 
#' # 
#' # ------------------------------------------------------
#' # +++     Cure (incidence) coefficient estimates     +++
#' # +++          and 95% confidence intervals *        +++
#' # ------------------------------------------------------
#' #              Estimate      2.5%     97.5%
#' # (Intercept)  1.136690  0.534618  1.526125
#' # x.1         -0.816737 -1.071404 -0.456797
#' # x.2          0.087270 -0.315229  0.469473
#' # x.3          0.910139  0.513726  1.251313
#' # x.4          0.058115 -0.321220  0.506324
#' # 
#' # ------------------------------------------------------
#' # +++    Survival (latency) coefficient estimates    +++
#' # +++          and 95% confidence intervals *        +++
#' # ------------------------------------------------------
#' #      Estimate      2.5%     97.5%
#' # z.1  1.033331  0.855820  1.157263
#' # z.2 -0.051417 -0.171534  0.125073
#' # z.3 -0.881202 -1.003755 -0.680853
#' # z.4 -0.070461 -0.199304  0.098877
#' # 
#' # ------------------------------------------------------
#' # * Confidence intervals computed by the basic 
#' #   bootstrap method, with replications.
#' # ------------------------------------------------------
#' 
#' # By default, confidence intervals are computed by the basic bootstrap method.
#' #  Otherwise, the user can specify the percentile bootstrap method.
#' summary(fit2,conf.int = "percentile")
#' #
#' # ------------------------------------------------------
#' # +++   PH cure model with time-varying covariates   +++
#' # ------------------------------------------------------
#' # Sample size: 500
#' # Censoring proportion: 0.56
#' # Number of unique event times: 220
#' # Tied failure times: FALSE
#' # 
#' # log-likelihood:  101.85 
#' # 
#' # ------------------------------------------------------
#' # +++     Cure (incidence) coefficient estimates     +++
#' # +++          and 95% confidence intervals *        +++
#' # ------------------------------------------------------
#' #              Estimate      2.5%     97.5%
#' # (Intercept)  1.136690  0.747255  1.738762
#' # x.1         -0.816737 -1.176677 -0.562070
#' # x.2          0.087270 -0.294933  0.489769
#' # x.3          0.910139  0.568964  1.306551
#' # x.4          0.058115 -0.390095  0.437450
#' # 
#' # ------------------------------------------------------
#' # +++    Survival (latency) coefficient estimates    +++
#' # +++          and 95% confidence intervals *        +++
#' # ------------------------------------------------------
#' #      Estimate      2.5%     97.5%
#' # z.1  1.033331  0.909398  1.210841
#' # z.2 -0.051417 -0.227906  0.068701
#' # z.3 -0.881202 -1.081551 -0.758648
#' # z.4 -0.070461 -0.239798  0.058382
#' # 
#' # ------------------------------------------------------
#' # * Confidence intervals computed by the percentile 
#' #   bootstrap method, with replications.
#' # ------------------------------------------------------
#' 
#' # By default, a 95% confidence level is used. Otherwise, the user can specify 
#' #  another confidence level: e.g. 90%.
#' summary(fit2,conf.int.level = 0.90)
#' # 
#' # ------------------------------------------------------
#' # +++   PH cure model with time-varying covariates   +++
#' # ------------------------------------------------------
#' # Sample size: 500
#' # Censoring proportion: 0.56
#' # Number of unique event times: 220
#' # Tied failure times: FALSE
#' # 
#' # log-likelihood:  101.85 
#' # 
#' # ------------------------------------------------------
#' # +++     Cure (incidence) coefficient estimates     +++
#' # +++          and 90% confidence intervals *        +++
#' # ------------------------------------------------------
#' #              Estimate        5%       95%
#' # (Intercept)  1.136690  0.625650  1.465492
#' # x.1         -0.816737 -1.043765 -0.491041
#' # x.2          0.087270 -0.233636  0.389681
#' # x.3          0.910139  0.616719  1.211806
#' # x.4          0.058115 -0.260685  0.364540
#' # 
#' # ------------------------------------------------------
#' # +++    Survival (latency) coefficient estimates    +++
#' # +++          and 90% confidence intervals *        +++
#' # ------------------------------------------------------
#' #      Estimate        5%       95%
#' # z.1  1.033331  0.870338  1.123005
#' # z.2 -0.051417 -0.163104  0.081329
#' # z.3 -0.881202 -0.997319 -0.705101
#' # z.4 -0.070461 -0.189484  0.051128
#' # 
#' # ------------------------------------------------------
#' # * Confidence intervals computed by the basic 
#' #   bootstrap method, with replications.
#' # ------------------------------------------------------
#' }
#' @export
summary.PHcure <- function(object,conf.int = c("basic","percentile"),
                           conf.int.level = 0.95,...){
  conf.int <- match.arg(conf.int)
  digits <- 6
  if (is.null(object$inference)){
    table_CURE <- round(as.matrix(object$b),digits)
    table_SURV <- round(as.matrix(object$beta),digits)
    colnames(table_SURV) <- colnames(table_CURE) <- c("Estimate")
    conf.int <- "no"
  } else {
    alpha <- 1 - conf.int.level
    perc_boot_CURE <- t(apply(object$inference$bs,2,
                              quantile,c(alpha/2,1-alpha/2)))
    perc_boot_SURV <- t(apply(object$inference$betas,2,
                              quantile,c(alpha/2,1-alpha/2)))
    if (conf.int=="percentile"){
      table_CURE <- round(cbind(object$b,perc_boot_CURE),digits)
      table_SURV <- round(cbind(object$beta,perc_boot_SURV),digits)
    } else if (conf.int=="basic"){
      table_CURE <- round(cbind(object$b,
                          2*object$b-perc_boot_CURE[,2],
                          2*object$b-perc_boot_CURE[,1]),digits)
      table_SURV <- round(cbind(object$beta,
                          2*object$beta-perc_boot_SURV[,2],
                          2*object$beta-perc_boot_SURV[,1]),digits)
    }
    colnames(table_SURV) <- 
      colnames(table_CURE) <- c("Estimate",
                                paste(alpha/2*100,"%",sep=''),
                                paste((1-alpha/2)*100,"%",sep=''))
  }
  rownames(table_CURE) <- names(object$b)
  rownames(table_SURV) <- names(object$beta)
  
  output <- list(N = object$N,
                 censoring = object$censoring,
                 K = object$K,
                 isTies = object$isTies,
                 conf.int = conf.int,
                 conf.int.level = conf.int.level,
                 logL = object$logL,
                 CURE = table_CURE,
                 SURV = table_SURV)

  class(output) <- 'summary.PHcure'
  
  return(output)
}